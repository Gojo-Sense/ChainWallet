// ============================================================================
// FILE: router.dart
// PURPOSE: Complete GoRouter configuration for AetherWallet
// ROUTES: Splash, Onboarding, MainShell (Home, Swap, Pulse, Settings), Scan,
//         Chat, Alerts, Lock Screen
// ============================================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/injection.dart';
import '../core/services/lock_service.dart';
import '../features/splash/presentation/splash_page.dart';
import '../features/auth/presentation/pages/lock_screen.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/wallet/presentation/bloc/wallet_bloc.dart';
import '../features/wallet/presentation/pages/wallet_landing_page.dart';
import '../features/wallet/presentation/pages/seed_display_page.dart';
import '../features/market/presentation/bloc/market_bloc.dart';
import '../features/market/presentation/pages/token_detail_page.dart';
import '../features/scan/presentation/scan_page.dart';
import '../features/shell/main_shell.dart';
import '../features/chat/presentation/bloc/chat_bloc.dart';
import '../features/chat/presentation/pages/chat_page.dart';
import '../features/alerts/presentation/bloc/alert_bloc.dart';
import '../features/alerts/presentation/pages/alerts_page.dart';
import '../features/portfolio/presentation/bloc/portfolio_bloc.dart';
import '../features/portfolio/presentation/pages/portfolio_page.dart';
import '../features/transactions/presentation/bloc/transaction_bloc.dart';
import '../features/transactions/presentation/pages/transactions_page.dart';
import '../features/nft/presentation/bloc/nft_bloc.dart';
import '../features/nft/presentation/pages/nft_gallery_page.dart';
import '../features/achievements/presentation/bloc/achievement_bloc.dart';
import '../features/achievements/presentation/pages/achievements_page.dart';
import '../features/admin/presentation/pages/admin_dashboard_page.dart';

/// App router configuration
class AppRouter {
  AppRouter._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  /// Route paths
  static const String splash = '/';
  static const String lock = '/lock';
  static const String login = '/login';
  static const String register = '/register';
  static const String onboarding = '/onboarding';
  static const String seedDisplay = '/seed-display';
  static const String home = '/home';
  static const String swap = '/swap';
  static const String scan = '/scan';
  static const String pulse = '/pulse';
  static const String settings = '/settings';
  static const String tokenDetail = '/token/:id';
  static const String chat = '/chat';
  static const String alerts = '/alerts';
  static const String portfolio = '/portfolio';
  static const String transactions = '/transactions';
  static const String nftGallery = '/nft';
  static const String achievements = '/achievements';
  static const String adminDashboard = '/admin-dashboard';

  /// GoRouter instance
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: splash,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final authBloc = getIt<AuthBloc>();
      final isAuthRoute = state.uri.path == login || state.uri.path == register;
      final isSplashRoute = state.uri.path == splash;
      final isOnboardingRoute = state.uri.path == onboarding;
      
      // Check auth status for protected routes
      if (!isAuthRoute && !isSplashRoute && !isOnboardingRoute) {
        authBloc.add(const AuthEvent.checkAuthStatus());
        // Note: Actual redirect will be handled by BLoC listener in pages
      }
      
      return null; // No redirect needed, let routes handle it
    },
    routes: [
      // ═══════════════════════════════════════════════════════════════════════
      // SPLASH SCREEN
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: splash,
        name: 'splash',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<WalletBloc>(),
            child: const SplashPage(),
          ),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // LOCK SCREEN (Biometric)
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: lock,
        name: 'lock',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LockScreen(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // AUTHENTICATION PAGES
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: login,
        name: 'login',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: register,
        name: 'register',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RegisterPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // WALLET ONBOARDING
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<WalletBloc>(),
            child: const WalletLandingPage(),
          ),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: seedDisplay,
        name: 'seedDisplay',
        pageBuilder: (context, state) {
          final mnemonic = state.extra as String? ?? '';
          return CustomTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (_) => getIt<WalletBloc>(),
              child: SeedDisplayPage(mnemonic: mnemonic),
            ),
            transitionsBuilder: _slideTransition,
          );
        },
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // MAIN SHELL WITH BOTTOM NAV
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: home,
        name: 'home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MainShell(initialIndex: 0),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: swap,
        name: 'swap',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MainShell(initialIndex: 1),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: pulse,
        name: 'pulse',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MainShell(initialIndex: 3),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: settings,
        name: 'settings',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MainShell(initialIndex: 4),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // SCAN PAGE (Modal - not in shell)
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: scan,
        name: 'scan',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ScanPage(),
          transitionDuration: const Duration(milliseconds: 350),
          transitionsBuilder: _scaleTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // TOKEN DETAIL PAGE
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: tokenDetail,
        name: 'tokenDetail',
        pageBuilder: (context, state) {
          final tokenId = state.pathParameters['id'] ?? 'bitcoin';
          return CustomTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (_) => getIt<MarketBloc>(),
              child: TokenDetailPage(tokenId: tokenId),
            ),
            transitionsBuilder: _slideUpTransition,
          );
        },
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // CHAT ASSISTANT PAGE
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: chat,
        name: 'chat',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<ChatBloc>(),
            child: const ChatPage(),
          ),
          transitionsBuilder: _slideUpTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // PRICE ALERTS PAGE
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: alerts,
        name: 'alerts',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<AlertBloc>(),
            child: const AlertsPage(),
          ),
          transitionsBuilder: _slideTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // PORTFOLIO ANALYTICS PAGE
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: portfolio,
        name: 'portfolio',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<PortfolioBloc>(),
            child: const PortfolioPage(),
          ),
          transitionsBuilder: _slideTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // TRANSACTION HISTORY PAGE
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: transactions,
        name: 'transactions',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<TransactionBloc>(),
            child: const TransactionsPage(),
          ),
          transitionsBuilder: _slideTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // NFT GALLERY PAGE
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: nftGallery,
        name: 'nftGallery',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<NFTBloc>(),
            child: const NFTGalleryPage(),
          ),
          transitionsBuilder: _slideTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // ACHIEVEMENTS PAGE
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: achievements,
        name: 'achievements',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (_) => getIt<AchievementBloc>(),
            child: const AchievementsPage(),
          ),
          transitionsBuilder: _slideTransition,
        ),
      ),

      // ═══════════════════════════════════════════════════════════════════════
      // ADMIN DASHBOARD PAGE (WebView - Angular)
      // ═══════════════════════════════════════════════════════════════════════
      GoRoute(
        path: adminDashboard,
        name: 'adminDashboard',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AdminDashboardPage(),
          transitionsBuilder: _slideTransition,
        ),
      ),
    ],

    // Error handler
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 64),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              state.uri.toString(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ],
        ),
      ),
    ),
  );

  // ═══════════════════════════════════════════════════════════════════════════
  // TRANSITION BUILDERS
  // ═══════════════════════════════════════════════════════════════════════════

  static Widget _fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(opacity: animation, child: child);
  }

  static Widget _slideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      )),
      child: child,
    );
  }

  static Widget _slideUpTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      )),
      child: FadeTransition(opacity: animation, child: child),
    );
  }

  static Widget _scaleTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.9, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          ),
        ),
        child: child,
      ),
    );
  }
}
