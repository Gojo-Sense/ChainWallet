import { Injectable } from '@angular/core';
import { ethers } from 'ethers';
import { BehaviorSubject, Observable, from } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { of } from 'rxjs';

export interface WalletInfo {
  address: string;
  balance: string;
  network: string;
}

export interface Transaction {
  hash: string;
  from: string;
  to: string;
  value: string;
  gasUsed: string;
  gasPrice: string;
  timestamp: number;
  status: 'pending' | 'success' | 'failed';
  blockNumber?: number;
  confirmations?: number;
}

@Injectable({
  providedIn: 'root'
})
export class BlockchainService {
  private provider: ethers.Provider | null = null;
  private signer: ethers.Signer | null = null;
  private walletInfo$ = new BehaviorSubject<WalletInfo | null>(null);
  private isTestMode = false;

  // RPC endpoints
  private mainnetRpc = 'https://eth.llamarpc.com';
  private sepoliaRpc = 'https://rpc.sepolia.org';
  
  // Explorer URLs
  private mainnetExplorer = 'https://etherscan.io';
  private sepoliaExplorer = 'https://sepolia.etherscan.io';

  constructor() {
    this.initializeProvider();
  }

  private initializeProvider(): void {
    const rpcUrl = this.isTestMode ? this.sepoliaRpc : this.mainnetRpc;
    this.provider = new ethers.JsonRpcProvider(rpcUrl);
  }

  setTestMode(enabled: boolean): void {
    this.isTestMode = enabled;
    this.initializeProvider();
    if (this.signer && this.provider) {
      this.signer = this.signer.connect(this.provider);
    }
  }

  isTestModeEnabled(): boolean {
    return this.isTestMode;
  }

  getExplorerUrl(): string {
    return this.isTestMode ? this.sepoliaExplorer : this.mainnetExplorer;
  }

  // Connect MetaMask wallet
  async connectWallet(): Promise<WalletInfo | null> {
    try {
      const ethereum = (window as any).ethereum;
      if (typeof ethereum === 'undefined') {
        throw new Error('MetaMask is not installed. Please install MetaMask extension.');
      }

      // Request account access
      const accounts = await ethereum.request({
        method: 'eth_requestAccounts'
      });

      if (accounts.length === 0) {
        throw new Error('No accounts found');
      }

      // Switch to correct network
      await this.switchNetwork();

      // Create provider and signer
      this.provider = new ethers.BrowserProvider(ethereum);
      this.signer = await (this.provider as ethers.BrowserProvider).getSigner();
      const address = await this.signer.getAddress();

      // Get balance
      const balance = await this.provider.getBalance(address);
      const balanceFormatted = ethers.formatEther(balance);

      const walletInfo: WalletInfo = {
        address,
        balance: balanceFormatted,
        network: this.isTestMode ? 'Sepolia' : 'Mainnet'
      };

      this.walletInfo$.next(walletInfo);

      // Listen for account changes
      ethereum.on('accountsChanged', (accounts: string[]) => {
        if (accounts.length > 0) {
          this.connectWallet();
        } else {
          this.disconnectWallet();
        }
      });

      // Listen for network changes
      ethereum.on('chainChanged', () => {
        this.connectWallet();
      });

      return walletInfo;
    } catch (error: any) {
      console.error('Error connecting wallet:', error);
      throw error;
    }
  }

  private async switchNetwork(): Promise<void> {
    const chainId = this.isTestMode ? '0xaa36a7' : '0x1'; // Sepolia: 11155111, Mainnet: 1

    try {
      const ethereum = (window as any).ethereum;
      if (!ethereum) {
        throw new Error('MetaMask is not installed');
      }
      await ethereum.request({
        method: 'wallet_switchEthereumChain',
        params: [{ chainId }]
      });
    } catch (switchError: any) {
      // This error code indicates that the chain has not been added to MetaMask
      if (switchError.code === 4902) {
        const chainParams = this.isTestMode
          ? {
              chainId: '0xaa36a7',
              chainName: 'Sepolia',
              nativeCurrency: { name: 'ETH', symbol: 'ETH', decimals: 18 },
              rpcUrls: [this.sepoliaRpc],
              blockExplorerUrls: [this.sepoliaExplorer]
            }
          : {
              chainId: '0x1',
              chainName: 'Ethereum Mainnet',
              nativeCurrency: { name: 'ETH', symbol: 'ETH', decimals: 18 },
              rpcUrls: [this.mainnetRpc],
              blockExplorerUrls: [this.mainnetExplorer]
            };

        const ethereum = (window as any).ethereum;
        if (!ethereum) {
          throw new Error('MetaMask is not installed');
        }
        await ethereum.request({
          method: 'wallet_addEthereumChain',
          params: [chainParams]
        });
      } else {
        throw switchError;
      }
    }
  }

  disconnectWallet(): void {
    this.signer = null;
    this.walletInfo$.next(null);
  }

  getWalletInfo(): Observable<WalletInfo | null> {
    return this.walletInfo$.asObservable();
  }

  // Get balance for an address
  async getBalance(address: string): Promise<string> {
    if (!this.provider) {
      throw new Error('Provider not initialized');
    }

    try {
      const balance = await this.provider.getBalance(address);
      return ethers.formatEther(balance);
    } catch (error) {
      console.error('Error getting balance:', error);
      throw error;
    }
  }

  // Send transaction
  async sendTransaction(to: string, amount: string): Promise<Transaction> {
    if (!this.signer) {
      throw new Error('Wallet not connected');
    }

    try {
      // Validate address
      if (!ethers.isAddress(to)) {
        throw new Error('Invalid Ethereum address');
      }

      // Estimate gas
      const gasEstimate = await this.signer.estimateGas({
        to,
        value: ethers.parseEther(amount)
      });

      // Get gas price
      const feeData = await this.provider!.getFeeData();
      const gasPrice = feeData.gasPrice || ethers.parseUnits('20', 'gwei');

      // Send transaction
      const tx = await this.signer.sendTransaction({
        to,
        value: ethers.parseEther(amount),
        gasLimit: gasEstimate,
        gasPrice
      });

      const transaction: Transaction = {
        hash: tx.hash,
        from: await this.signer.getAddress(),
        to,
        value: amount,
        gasUsed: gasEstimate.toString(),
        gasPrice: gasPrice.toString(),
        timestamp: Date.now(),
        status: 'pending'
      };

      // Wait for transaction confirmation
      this.waitForConfirmation(tx.hash).then((receipt) => {
        transaction.status = receipt.status === 1 ? 'success' : 'failed';
        transaction.blockNumber = receipt.blockNumber;
        transaction.gasUsed = receipt.gasUsed.toString();
      });

      return transaction;
    } catch (error: any) {
      console.error('Error sending transaction:', error);
      throw error;
    }
  }

  // Wait for transaction confirmation
  private async waitForConfirmation(txHash: string): Promise<ethers.TransactionReceipt> {
    if (!this.provider) {
      throw new Error('Provider not initialized');
    }

    const receipt = await this.provider.waitForTransaction(txHash);
    if (!receipt) {
      throw new Error('Transaction receipt not found');
    }
    return receipt;
  }

  // Get transaction history for an address
  async getTransactionHistory(address: string, limit: number = 20): Promise<Transaction[]> {
    if (!this.provider) {
      throw new Error('Provider not initialized');
    }

    try {
      // Note: This is a simplified version. In production, use a service like Etherscan API
      // or The Graph for better transaction history
      const explorerUrl = this.getExplorerUrl();
      const apiUrl = explorerUrl.replace('etherscan.io', 'api.etherscan.io');
      
      // For now, return empty array. In production, implement Etherscan API call
      // const response = await fetch(`${apiUrl}/api?module=account&action=txlist&address=${address}&startblock=0&endblock=99999999&sort=desc&apikey=YOUR_API_KEY`);
      
      return [];
    } catch (error) {
      console.error('Error getting transaction history:', error);
      return [];
    }
  }

  // Get transaction details
  async getTransaction(txHash: string): Promise<Transaction | null> {
    if (!this.provider) {
      throw new Error('Provider not initialized');
    }

    try {
      const tx = await this.provider.getTransaction(txHash);
      const receipt = await this.provider.getTransactionReceipt(txHash);

      if (!tx) {
        return null;
      }

      return {
        hash: tx.hash,
        from: tx.from,
        to: tx.to || '',
        value: ethers.formatEther(tx.value),
        gasUsed: receipt?.gasUsed.toString() || '0',
        gasPrice: tx.gasPrice?.toString() || '0',
        timestamp: (await this.provider.getBlock(receipt?.blockNumber || 0))?.timestamp || Date.now(),
        status: receipt ? (receipt.status === 1 ? 'success' : 'failed') : 'pending',
        blockNumber: receipt?.blockNumber,
        confirmations: receipt ? await receipt.confirmations() : 0
      };
    } catch (error) {
      console.error('Error getting transaction:', error);
      return null;
    }
  }

  // Estimate gas for a transaction
  async estimateGas(to: string, amount: string): Promise<string> {
    if (!this.signer) {
      throw new Error('Wallet not connected');
    }

    try {
      const gasEstimate = await this.signer.estimateGas({
        to,
        value: ethers.parseEther(amount)
      });
      return gasEstimate.toString();
    } catch (error) {
      console.error('Error estimating gas:', error);
      throw error;
    }
  }

  // Get current gas price
  async getGasPrice(): Promise<string> {
    if (!this.provider) {
      throw new Error('Provider not initialized');
    }

    try {
      const feeData = await this.provider.getFeeData();
      return feeData.gasPrice?.toString() || '0';
    } catch (error) {
      console.error('Error getting gas price:', error);
      throw error;
    }
  }

  // Generate test wallet (for demo purposes)
  generateTestWallet(): { address: string; privateKey: string } {
    const wallet = ethers.Wallet.createRandom();
    return {
      address: wallet.address,
      privateKey: wallet.privateKey
    };
  }
}

// Extend Window interface for MetaMask
declare global {
  interface Window {
    ethereum?: {
      request: (args: { method: string; params?: any[] }) => Promise<any>;
      on: (event: string, handler: (args: any) => void) => void;
      removeListener: (event: string, handler: (args: any) => void) => void;
    };
  }
}

