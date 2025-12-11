import { Component, OnInit, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { NavSidebarComponent } from '../shared/nav-sidebar.component';
import { BlockchainService, WalletInfo } from '../../services/blockchain.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-settings',
  standalone: true,
  imports: [CommonModule, FormsModule, NavSidebarComponent],
  templateUrl: './settings.component.html',
  styleUrl: './settings.component.css'
})
export class SettingsComponent implements OnInit, OnDestroy {
  // Existing settings
  notificationsEnabled = true;
  emailNotifications = true;
  pushNotifications = false;
  darkMode = true;
  language = 'en';
  currency = 'USD';
  
  // Security settings
  autoLockTimeout = '15min';
  sessionTimeout = '1hr';
  requirePasswordForTransactions = false;
  showPrivateKeysWarning = true;
  clearClipboardAfterCopy = true;

  // Network & Blockchain settings
  isTestMode = false;
  currentNetwork = 'Mainnet';
  customRpcEndpoint = '';
  blockExplorer = 'Etherscan';
  gasPriceStrategy = 'Standard';
  defaultGasLimit = 21000;

  // Wallet management
  walletAddress: string | null = null;
  walletBalance: string | null = null;

  // Transaction settings
  defaultSlippageTolerance = 0.5;
  transactionTimeout = 300;
  autoApproveSmallTransactions = false;
  smallTransactionThreshold = 0.01;
  gasPriceMultiplier = 1.0;
  showTransactionDetails = true;

  // Privacy settings
  analyticsEnabled = true;
  shareUsageData = false;

  // Advanced settings
  developerMode = false;
  showConsoleLogs = false;
  customRpcEndpointAdvanced = '';

  // About
  appVersion = '1.0.0';
  buildNumber = '2024.01.01';

  // UI state
  showLogoutConfirm = false;
  showClearHistoryConfirm = false;
  showResetConfirm = false;
  showExportWarning = false;
  unsavedChanges = false;

  private walletSubscription?: Subscription;

  constructor(
    private router: Router,
    public blockchain: BlockchainService
  ) {}

  ngOnInit(): void {
    this.loadSettings();
    this.loadWalletInfo();
    
    // Subscribe to wallet changes
    this.walletSubscription = this.blockchain.getWalletInfo().subscribe(
      (walletInfo: WalletInfo | null) => {
        if (walletInfo) {
          this.walletAddress = walletInfo.address;
          this.walletBalance = walletInfo.balance;
          this.currentNetwork = walletInfo.network;
        } else {
          this.walletAddress = null;
          this.walletBalance = null;
        }
      }
    );

    // Check if test mode is enabled
    this.isTestMode = this.blockchain.isTestModeEnabled();
    this.currentNetwork = this.isTestMode ? 'Sepolia' : 'Mainnet';
  }

  ngOnDestroy(): void {
    this.walletSubscription?.unsubscribe();
  }

  loadSettings(): void {
    const saved = localStorage.getItem('appSettings');
    if (saved) {
      const settings = JSON.parse(saved);
      
      // Existing settings
      this.notificationsEnabled = settings.notificationsEnabled ?? true;
      this.emailNotifications = settings.emailNotifications ?? true;
      this.pushNotifications = settings.pushNotifications ?? false;
      this.darkMode = settings.darkMode ?? true;
      this.language = settings.language ?? 'en';
      this.currency = settings.currency ?? 'USD';
      
      // Security settings
      this.autoLockTimeout = settings.autoLockTimeout ?? '15min';
      this.sessionTimeout = settings.sessionTimeout ?? '1hr';
      this.requirePasswordForTransactions = settings.requirePasswordForTransactions ?? false;
      this.showPrivateKeysWarning = settings.showPrivateKeysWarning ?? true;
      this.clearClipboardAfterCopy = settings.clearClipboardAfterCopy ?? true;

      // Network settings
      this.customRpcEndpoint = settings.customRpcEndpoint ?? '';
      this.blockExplorer = settings.blockExplorer ?? 'Etherscan';
      this.gasPriceStrategy = settings.gasPriceStrategy ?? 'Standard';
      this.defaultGasLimit = settings.defaultGasLimit ?? 21000;

      // Transaction settings
      this.defaultSlippageTolerance = settings.defaultSlippageTolerance ?? 0.5;
      this.transactionTimeout = settings.transactionTimeout ?? 300;
      this.autoApproveSmallTransactions = settings.autoApproveSmallTransactions ?? false;
      this.smallTransactionThreshold = settings.smallTransactionThreshold ?? 0.01;
      this.gasPriceMultiplier = settings.gasPriceMultiplier ?? 1.0;
      this.showTransactionDetails = settings.showTransactionDetails ?? true;

      // Privacy settings
      this.analyticsEnabled = settings.analyticsEnabled ?? true;
      this.shareUsageData = settings.shareUsageData ?? false;

      // Advanced settings
      this.developerMode = settings.developerMode ?? false;
      this.showConsoleLogs = settings.showConsoleLogs ?? false;
      this.customRpcEndpointAdvanced = settings.customRpcEndpointAdvanced ?? '';
    }
  }

  saveSettings(): void {
    const settings = {
      version: '1.0.0',
      // Existing settings
      notificationsEnabled: this.notificationsEnabled,
      emailNotifications: this.emailNotifications,
      pushNotifications: this.pushNotifications,
      darkMode: this.darkMode,
      language: this.language,
      currency: this.currency,
      
      // Security settings
      autoLockTimeout: this.autoLockTimeout,
      sessionTimeout: this.sessionTimeout,
      requirePasswordForTransactions: this.requirePasswordForTransactions,
      showPrivateKeysWarning: this.showPrivateKeysWarning,
      clearClipboardAfterCopy: this.clearClipboardAfterCopy,

      // Network settings
      customRpcEndpoint: this.customRpcEndpoint,
      blockExplorer: this.blockExplorer,
      gasPriceStrategy: this.gasPriceStrategy,
      defaultGasLimit: this.defaultGasLimit,

      // Transaction settings
      defaultSlippageTolerance: this.defaultSlippageTolerance,
      transactionTimeout: this.transactionTimeout,
      autoApproveSmallTransactions: this.autoApproveSmallTransactions,
      smallTransactionThreshold: this.smallTransactionThreshold,
      gasPriceMultiplier: this.gasPriceMultiplier,
      showTransactionDetails: this.showTransactionDetails,

      // Privacy settings
      analyticsEnabled: this.analyticsEnabled,
      shareUsageData: this.shareUsageData,

      // Advanced settings
      developerMode: this.developerMode,
      showConsoleLogs: this.showConsoleLogs,
      customRpcEndpointAdvanced: this.customRpcEndpointAdvanced,
    };
    
    localStorage.setItem('appSettings', JSON.stringify(settings));
    this.unsavedChanges = false;
    this.showToast('Settings saved successfully!');
  }

  loadWalletInfo(): void {
    this.blockchain.getWalletInfo().subscribe((walletInfo: WalletInfo | null) => {
      if (walletInfo) {
        this.walletAddress = walletInfo.address;
        this.walletBalance = walletInfo.balance;
        this.currentNetwork = walletInfo.network;
      }
    });
  }

  toggleTestMode(): void {
    this.isTestMode = !this.isTestMode;
    this.blockchain.setTestMode(this.isTestMode);
    this.currentNetwork = this.isTestMode ? 'Sepolia' : 'Mainnet';
    this.unsavedChanges = true;
  }

  disconnectWallet(): void {
    this.blockchain.disconnectWallet();
    this.walletAddress = null;
    this.walletBalance = null;
    this.showToast('Wallet disconnected');
  }

  copyToClipboard(text: string): void {
    navigator.clipboard.writeText(text).then(() => {
      this.showToast('Copied to clipboard');
      
      if (this.clearClipboardAfterCopy) {
        setTimeout(() => {
          navigator.clipboard.writeText('');
        }, 30000); // Clear after 30 seconds
      }
    }).catch(err => {
      console.error('Failed to copy:', err);
      this.showToast('Failed to copy to clipboard');
    });
  }

  viewOnExplorer(): void {
    if (this.walletAddress) {
      const explorerUrl = this.blockchain.getExplorerUrl();
      window.open(`${explorerUrl}/address/${this.walletAddress}`, '_blank');
    }
  }

  exportWalletInfo(): void {
    if (!this.walletAddress) {
      this.showToast('No wallet connected');
      return;
    }
    
    const walletInfo = {
      address: this.walletAddress,
      network: this.currentNetwork,
      exportedAt: new Date().toISOString(),
      warning: 'This file contains your public address only. Never share your private keys!'
    };
    
    const blob = new Blob([JSON.stringify(walletInfo, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `wallet-info-${Date.now()}.json`;
    a.click();
    URL.revokeObjectURL(url);
    this.showExportWarning = false;
    this.showToast('Wallet info exported');
  }

  clearTransactionHistory(): void {
    localStorage.removeItem('transactionHistory');
    this.showClearHistoryConfirm = false;
    this.showToast('Transaction history cleared');
  }

  exportSettings(): void {
    const saved = localStorage.getItem('appSettings');
    if (saved) {
      const blob = new Blob([saved], { type: 'application/json' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = `settings-${Date.now()}.json`;
      a.click();
      URL.revokeObjectURL(url);
      this.showToast('Settings exported');
    }
  }

  importSettings(event: Event): void {
    const input = event.target as HTMLInputElement;
    const file = input.files?.[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = (e) => {
      try {
        const settings = JSON.parse(e.target?.result as string);
        localStorage.setItem('appSettings', JSON.stringify(settings));
        this.loadSettings();
        this.showToast('Settings imported successfully');
      } catch (error) {
        this.showToast('Failed to import settings. Invalid file format.');
      }
    };
    reader.readAsText(file);
    input.value = '';
  }

  resetSettings(): void {
    localStorage.removeItem('appSettings');
    this.loadSettings();
    this.showResetConfirm = false;
    this.showToast('Settings reset to defaults');
  }

  confirmLogout(): void {
    this.showLogoutConfirm = true;
  }

  cancelLogout(): void {
    this.showLogoutConfirm = false;
  }

  logout(): void {
    localStorage.clear();
    this.showLogoutConfirm = false;
    this.showToast('Logged out successfully');
    // In a real app, you would navigate to login page
    // this.router.navigate(['/login']);
  }

  showToast(message: string): void {
    // Simple toast notification
    const toast = document.createElement('div');
    toast.className = 'toast-message';
    toast.textContent = message;
    document.body.appendChild(toast);
    
    setTimeout(() => {
      toast.classList.add('show');
    }, 10);
    
    setTimeout(() => {
      toast.classList.remove('show');
      setTimeout(() => {
        document.body.removeChild(toast);
      }, 300);
    }, 3000);
  }

  onSettingChange(): void {
    this.unsavedChanges = true;
  }
}

