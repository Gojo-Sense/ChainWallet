import { Component, OnInit, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { BlockchainService, WalletInfo, Transaction } from '../../services/blockchain.service';
import { Subscription } from 'rxjs';
import { NavSidebarComponent } from '../shared/nav-sidebar.component';

interface Wallet {
  id: string;
  name: string;
  address: string;
  balance: number;
  currency: string;
}

@Component({
  selector: 'app-wallet',
  standalone: true,
  imports: [CommonModule, FormsModule, NavSidebarComponent],
  templateUrl: './wallet.component.html',
  styleUrl: './wallet.component.css'
})
export class WalletComponent implements OnInit, OnDestroy {
  wallets: Wallet[] = [
    { id: '1', name: 'Main Wallet', address: '0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb', balance: 2.5, currency: 'ETH' },
    { id: '2', name: 'Trading Wallet', address: '0x8ba1f109551bD432803012645Hac136c22C1779', balance: 0.8, currency: 'BTC' }
  ];

  showSendForm = false;
  showReceiveForm = false;
  sendAmount = 0;
  sendAddress = '';
  selectedWallet: Wallet | null = null;
  connectedWallet: WalletInfo | null = null;
  isTestMode = false;
  isConnecting = false;
  realTransactions: Transaction[] = [];
  gasEstimate = '0';
  gasPrice = '0';

  private walletSubscription?: Subscription;

  constructor(public blockchain: BlockchainService) {}

  ngOnInit(): void {
    if (this.wallets.length > 0) {
      this.selectedWallet = this.wallets[0];
    }

    // Subscribe to wallet info updates
    this.walletSubscription = this.blockchain.getWalletInfo().subscribe({
      next: (walletInfo) => {
        this.connectedWallet = walletInfo;
        if (walletInfo) {
          this.loadTransactionHistory(walletInfo.address);
        }
      }
    });

    // Load test mode preference
    this.isTestMode = localStorage.getItem('testMode') === 'true';
    this.blockchain.setTestMode(this.isTestMode);
  }

  ngOnDestroy(): void {
    if (this.walletSubscription) {
      this.walletSubscription.unsubscribe();
    }
  }

  selectWallet(wallet: Wallet): void {
    this.selectedWallet = wallet;
  }

  openSendForm(): void {
    this.showSendForm = true;
  }

  closeSendForm(): void {
    this.showSendForm = false;
    this.sendAmount = 0;
    this.sendAddress = '';
  }

  openReceiveForm(): void {
    this.showReceiveForm = true;
  }

  closeReceiveForm(): void {
    this.showReceiveForm = false;
  }

  async sendCrypto(): Promise<void> {
    if (!this.sendAmount || this.sendAmount <= 0 || !this.sendAddress) {
      alert('Please fill all fields correctly');
      return;
    }

    if (!this.connectedWallet) {
      alert('Please connect your wallet first');
      return;
    }

    // Validate Ethereum address
    if (!/^0x[a-fA-F0-9]{40}$/.test(this.sendAddress)) {
      alert('Invalid Ethereum address');
      return;
    }

    try {
      // Estimate gas first
      await this.estimateGasForTransaction();
      const gasCost = (parseFloat(this.gasEstimate) * parseFloat(this.gasPrice)) / 1e18;
      const totalCost = this.sendAmount + gasCost;

      if (parseFloat(this.connectedWallet.balance) < totalCost) {
        alert(`Insufficient balance. Need ${totalCost.toFixed(6)} ETH (including gas)`);
        return;
      }

      // Confirm transaction
      const confirmMsg = `Send ${this.sendAmount} ETH to ${this.sendAddress}?\n\nGas estimate: ${gasCost.toFixed(6)} ETH\nTotal: ${totalCost.toFixed(6)} ETH\n\nNetwork: ${this.isTestMode ? 'Sepolia Testnet' : 'Ethereum Mainnet'}`;
      if (!confirm(confirmMsg)) {
        return;
      }

      // Send transaction
      const transaction = await this.blockchain.sendTransaction(this.sendAddress, this.sendAmount.toString());
      
      alert(`Transaction sent!\nHash: ${transaction.hash}\n\nView on explorer: ${this.blockchain.getExplorerUrl()}/tx/${transaction.hash}`);
      
      // Update balance
      if (this.connectedWallet) {
        this.connectedWallet.balance = (parseFloat(this.connectedWallet.balance) - totalCost).toString();
      }

      // Reload transaction history
      if (this.connectedWallet) {
        await this.loadTransactionHistory(this.connectedWallet.address);
      }

      this.closeSendForm();
    } catch (error: any) {
      alert('Error sending transaction: ' + error.message);
    }
  }

  generateTestWallet(): void {
    const testWallet = this.blockchain.generateTestWallet();
    alert(`Test Wallet Generated:\n\nAddress: ${testWallet.address}\n\n⚠️ Private Key (keep secret):\n${testWallet.privateKey}\n\nThis is for testing only!`);
  }

  copyAddress(): void {
    const address = this.connectedWallet?.address || this.selectedWallet?.address;
    if (address) {
      navigator.clipboard.writeText(address);
      alert('Address copied to clipboard!');
    }
  }

  parseFloat(value: string): number {
    return parseFloat(value) || 0;
  }

  async connectMetaMask(): Promise<void> {
    this.isConnecting = true;
    try {
      const walletInfo = await this.blockchain.connectWallet();
      if (walletInfo) {
        this.connectedWallet = walletInfo;
        await this.loadTransactionHistory(walletInfo.address);
        await this.estimateGasForTransaction();
      }
    } catch (error: any) {
      alert('Error connecting wallet: ' + error.message);
    } finally {
      this.isConnecting = false;
    }
  }

  disconnectWallet(): void {
    this.blockchain.disconnectWallet();
    this.connectedWallet = null;
    this.realTransactions = [];
  }

  toggleTestMode(): void {
    this.isTestMode = !this.isTestMode;
    localStorage.setItem('testMode', this.isTestMode.toString());
    this.blockchain.setTestMode(this.isTestMode);
    if (this.connectedWallet) {
      this.connectMetaMask(); // Reconnect with new network
    }
  }

  async loadTransactionHistory(address: string): Promise<void> {
    try {
      this.realTransactions = await this.blockchain.getTransactionHistory(address);
    } catch (error) {
      console.error('Error loading transaction history:', error);
    }
  }

  async estimateGasForTransaction(): Promise<void> {
    if (!this.sendAddress || !this.sendAmount || !this.connectedWallet) {
      return;
    }

    try {
      this.gasEstimate = await this.blockchain.estimateGas(this.sendAddress, this.sendAmount.toString());
      this.gasPrice = await this.blockchain.getGasPrice();
    } catch (error) {
      console.error('Error estimating gas:', error);
    }
  }
}

