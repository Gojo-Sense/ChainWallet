import { Component, OnInit, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BlockchainService, Transaction as BlockchainTransaction } from '../../services/blockchain.service';
import { Subscription } from 'rxjs';
import { NavSidebarComponent } from '../shared/nav-sidebar.component';

interface Transaction {
  id: string;
  type: 'deposit' | 'withdrawal' | 'trade' | 'transfer';
  amount: number;
  currency: string;
  date: Date;
  status: 'completed' | 'pending' | 'failed';
  description: string;
  hash?: string;
  from?: string;
  to?: string;
  blockNumber?: number;
  confirmations?: number;
}

@Component({
  selector: 'app-calendar',
  standalone: true,
  imports: [CommonModule, NavSidebarComponent],
  templateUrl: './calendar.component.html',
  styleUrl: './calendar.component.css'
})
export class CalendarComponent implements OnInit, OnDestroy {
  transactions: Transaction[] = [];
  blockchainTransactions: BlockchainTransaction[] = [];
  selectedDate: Date = new Date();
  filterType: 'all' | 'deposit' | 'withdrawal' | 'trade' | 'transfer' = 'all';
  filterTypes: ('all' | 'deposit' | 'withdrawal' | 'trade' | 'transfer')[] = ['all', 'deposit', 'withdrawal', 'trade', 'transfer'];
  connectedAddress: string | null = null;

  private walletSubscription?: Subscription;

  constructor(private blockchain: BlockchainService) {}

  ngOnInit(): void {
    this.loadTransactions();
    
    // Subscribe to wallet info to load blockchain transactions
    this.walletSubscription = this.blockchain.getWalletInfo().subscribe({
      next: (walletInfo) => {
        if (walletInfo) {
          this.connectedAddress = walletInfo.address;
          this.loadBlockchainTransactions(walletInfo.address);
        }
      }
    });
  }

  ngOnDestroy(): void {
    if (this.walletSubscription) {
      this.walletSubscription.unsubscribe();
    }
  }

  async loadBlockchainTransactions(address: string): Promise<void> {
    try {
      this.blockchainTransactions = await this.blockchain.getTransactionHistory(address);
      // Merge with mock transactions
      this.transactions = [...this.blockchainTransactions.map(tx => {
        const txDate = tx.timestamp ? new Date(tx.timestamp * 1000) : new Date();
        const txStatus = tx.status === 'success' ? 'completed' as const 
          : tx.status === 'pending' ? 'pending' as const 
          : 'failed' as const;
        return {
          id: tx.hash || '',
          type: 'transfer' as const,
          amount: parseFloat(tx.value),
          currency: 'ETH',
          date: txDate,
          status: txStatus,
          description: `Blockchain transaction ${tx.hash ? tx.hash.substring(0, 10) : 'unknown'}...`,
          hash: tx.hash || '',
          from: tx.from,
          to: tx.to,
          blockNumber: tx.blockNumber,
          confirmations: tx.confirmations
        };
      }), ...this.transactions.filter(t => !t.hash)];
    } catch (error) {
      console.error('Error loading blockchain transactions:', error);
    }
  }

  getExplorerUrl(): string {
    return this.blockchain.getExplorerUrl();
  }

  loadTransactions(): void {
    // Mock transaction data
    this.transactions = [
      {
        id: '1',
        type: 'deposit',
        amount: 1000,
        currency: 'USD',
        date: new Date(2024, 6, 15),
        status: 'completed',
        description: 'Deposit to trading account'
      },
      {
        id: '2',
        type: 'trade',
        amount: 0.05,
        currency: 'BTC',
        date: new Date(2024, 6, 16),
        status: 'completed',
        description: 'Bought BTC'
      },
      {
        id: '3',
        type: 'transfer',
        amount: 100,
        currency: 'USD',
        date: new Date(2024, 6, 17),
        status: 'completed',
        description: 'Sent to wallet'
      },
      {
        id: '4',
        type: 'withdrawal',
        amount: 500,
        currency: 'USD',
        date: new Date(2024, 6, 18),
        status: 'pending',
        description: 'Withdrawal request'
      }
    ];
  }

  setFilterType(type: 'all' | 'deposit' | 'withdrawal' | 'trade' | 'transfer'): void {
    this.filterType = type;
  }

  getFilteredTransactions(): Transaction[] {
    if (this.filterType === 'all') {
      return this.transactions;
    }
    return this.transactions.filter(t => t.type === this.filterType);
  }

  getTransactionIcon(type: string): string {
    switch (type) {
      case 'deposit': return '💰';
      case 'withdrawal': return '💸';
      case 'trade': return '📈';
      case 'transfer': return '🔄';
      default: return '📋';
    }
  }

  getStatusColor(status: string): string {
    switch (status) {
      case 'completed': return '#7cff00';
      case 'pending': return '#ffa500';
      case 'failed': return '#ff4757';
      default: return '#ffffff';
    }
  }
}

