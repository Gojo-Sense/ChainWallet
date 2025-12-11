import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterModule, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';

interface Payment {
  id: string;
  name: string;
  amount: string;
  dueDate: string;
  icon: string;
}

interface Notification {
  id: string;
  title: string;
  message: string;
  time: string;
  type: 'transfer' | 'payment' | 'spending';
  action?: string;
}

interface Contact {
  id: string;
  name: string;
  avatar: string;
}

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent implements OnInit {
  currentRoute = '/dashboard';
  earning = 21500.00;
  earningChange = 12;
  spending = 5392.00;
  spendingChange = 8;
  totalBalance = 81910.00;
  balanceChange = 12.81;
  
  selectedTab: 'weekly' | 'monthly' | 'yearly' = 'weekly';
  
  chartData = [
    { date: '3 July', value: 20.00 },
    { date: '4 July', value: 45.00 },
    { date: '5 July', value: 35.00 },
    { date: '6 July', value: 55.00 },
    { date: '7 July', value: 58.75 },
    { date: '8 July', value: 42.00 },
    { date: '9 July', value: 60.00 }
  ];
  
  payments: Payment[] = [
    {
      id: '1',
      name: 'Electricity',
      amount: '$20.30',
      dueDate: 'before 15 July',
      icon: '⚡'
    },
    {
      id: '2',
      name: 'Internet',
      amount: '$40.00',
      dueDate: 'before 20 July',
      icon: '🌐'
    }
  ];
  
  cardNumber = '**** **** **** 1890';
  cardExpiry = '05/26';
  cardBalance = 32819.00;
  cardName = 'Leonardo Cap';
  
  contacts: Contact[] = [
    { id: '1', name: 'A', avatar: 'A' },
    { id: '2', name: 'B', avatar: 'B' },
    { id: '3', name: 'C', avatar: 'C' },
    { id: '4', name: 'D', avatar: 'D' },
    { id: '5', name: 'E', avatar: 'E' }
  ];
  
  notifications: Notification[] = [
    {
      id: '1',
      title: 'Josep akbar',
      message: 'Just sent you $10,000',
      time: 'Just now',
      type: 'transfer',
      action: 'Click for detail'
    },
    {
      id: '2',
      title: 'Water bill ($15.00)',
      message: 'Pay before 28 July',
      time: '15m ago',
      type: 'payment',
      action: 'Pay now'
    },
    {
      id: '3',
      title: 'Spending',
      message: 'You spent more than $5,000',
      time: '6h ago',
      type: 'spending',
      action: 'Click for detail'
    }
  ];
  
  marketplaces = [
    { name: 'Tokopaedi', connected: true, logo: '🛒' },
    { name: 'Beli beli', connected: true, logo: '🛍️' },
    { name: 'Amajon', connected: false, logo: '📦' }
  ];
  
  maxChartValue = 80;
  
  constructor(private router: Router) {}

  ngOnInit(): void {
    // Track current route for navigation highlighting
    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe((event: any) => {
        this.currentRoute = event.url;
      });
    this.currentRoute = this.router.url;
  }
  
  isActiveRoute(route: string): boolean {
    return this.currentRoute === route || this.currentRoute.startsWith(route + '/');
  }
  
  logout(): void {
    if (confirm('Are you sure you want to logout?')) {
      localStorage.clear();
      alert('Logged out successfully');
      // In a real app, navigate to login
    }
  }
  
  getChartHeight(value: number): number {
    return (value / this.maxChartValue) * 100;
  }
  
  selectTab(tab: 'weekly' | 'monthly' | 'yearly'): void {
    this.selectedTab = tab;
    // Update chart data based on tab
  }
  
  getHighlightedDate(): string {
    return this.chartData[4].date; // 7 July
  }
  
  getHighlightedValue(): string {
    return `$${this.chartData[4].value}`;
  }
  
  formatCurrency(value: number): string {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
      minimumFractionDigits: 2,
      maximumFractionDigits: 2
    }).format(value);
  }
}

