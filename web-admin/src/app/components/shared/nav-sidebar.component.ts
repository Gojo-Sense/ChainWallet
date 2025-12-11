import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterModule, NavigationEnd } from '@angular/router';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'app-nav-sidebar',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <aside class="sidebar-left">
      <div class="sidebar-content">
        <div class="logo">V</div>
        <nav class="sidebar-nav">
          <a routerLink="/dashboard" [class.active]="isActiveRoute('/dashboard')" class="nav-item">
            <span class="nav-icon">🏠</span>
          </a>
          <a routerLink="/wallet" [class.active]="isActiveRoute('/wallet')" class="nav-item">
            <span class="nav-icon">👛</span>
          </a>
          <a routerLink="/trading" [class.active]="isActiveRoute('/trading')" class="nav-item">
            <span class="nav-icon">🛒</span>
          </a>
          <a routerLink="/calendar" [class.active]="isActiveRoute('/calendar')" class="nav-item">
            <span class="nav-icon">📅</span>
          </a>
          <a routerLink="/settings" [class.active]="isActiveRoute('/settings')" class="nav-item">
            <span class="nav-icon">⚙️</span>
          </a>
          <a href="#" class="nav-item" (click)="logout($event)" title="Logout">
            <span class="nav-icon">🚪</span>
          </a>
        </nav>
      </div>
    </aside>
  `,
  styles: [`
    .sidebar-left {
      width: 80px;
      background: #1a1a1a;
      border-radius: 20px;
      padding: 24px 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      height: fit-content;
      position: sticky;
      top: 20px;
    }

    .logo {
      font-size: 32px;
      font-weight: bold;
      color: #ff4757;
      margin-bottom: 40px;
      width: 48px;
      height: 48px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 12px;
      background: rgba(255, 71, 87, 0.1);
    }

    .sidebar-nav {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .nav-item {
      width: 48px;
      height: 48px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 12px;
      text-decoration: none;
      transition: all 0.3s ease;
      background: transparent;
    }

    .nav-item:hover {
      background: rgba(255, 255, 255, 0.05);
    }

    .nav-item.active {
      background: rgba(124, 255, 0, 0.15);
      border: 1px solid rgba(124, 255, 0, 0.3);
    }

    .nav-icon {
      font-size: 24px;
    }
  `]
})
export class NavSidebarComponent implements OnInit {
  currentRoute = '';

  constructor(private router: Router) {}

  ngOnInit(): void {
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

  logout(event: Event): void {
    event.preventDefault();
    if (confirm('Are you sure you want to logout?')) {
      localStorage.clear();
      alert('Logged out successfully');
    }
  }
}

