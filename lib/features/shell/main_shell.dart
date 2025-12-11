// ============================================================================
// FILE: main_shell.dart
// PURPOSE: Main shell with persistent bottom navigation using IndexedStack
// DESIGN: Deep Glassmorphism bottom nav with neon green accents
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/di/injection.dart';
import '../market/presentation/bloc/market_bloc.dart';
import '../market/presentation/pages/home_page.dart';
import '../swap/presentation/bloc/swap_bloc.dart';
import '../swap/presentation/pages/swap_page.dart';
import '../pulse/presentation/pulse_page.dart';
import '../settings/presentation/pages/settings_page.dart';
import '../wallet/presentation/bloc/wallet_bloc.dart';
import '../transactions/presentation/bloc/transaction_bloc.dart';
import '../portfolio/presentation/bloc/portfolio_bloc.dart';
import '../admin/presentation/pages/admin_dashboard_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabSelected(int index) {
    // Index 3 is the center scan button - handle differently
    if (index == 3) {
      HapticFeedback.mediumImpact();
      context.push('/scan');
      return;
    }

    if (_currentIndex != index) {
      HapticFeedback.lightImpact();
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: IndexedStack(
        index: _getStackIndex(_currentIndex),
        children: [
          // Index 0: Home
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<WalletBloc>()),
              BlocProvider(create: (_) => getIt<MarketBloc>()),
              BlocProvider(create: (_) => getIt<TransactionBloc>()),
              BlocProvider(create: (_) => getIt<PortfolioBloc>()),
            ],
            child: const HomePage(),
          ),
          // Index 1: Dashboard (Angular)
          const AdminDashboardPage(),
          // Index 2: Swap
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getIt<SwapBloc>()),
              BlocProvider(create: (_) => getIt<MarketBloc>()),
            ],
            child: const SwapPage(),
          ),
          // Index 3: Pulse (index 4 in nav, but 3 in stack since scan is modal)
          const PulsePage(),
          // Index 4: Settings
          BlocProvider(
            create: (_) => getIt<WalletBloc>(),
            child: const SettingsPage(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Convert nav index to stack index (skip scan which is index 3 in nav)
  // Nav: 0=Home, 1=Dashboard, 2=Swap, 3=Scan(modal), 4=Pulse, 5=Settings
  // Stack: 0=Home, 1=Dashboard, 2=Swap, 3=Pulse, 4=Settings
  int _getStackIndex(int navIndex) {
    if (navIndex < 3) return navIndex; // Home=0, Dashboard=1, Swap=2
    if (navIndex == 3) return 0; // Scan is modal, shouldn't reach here
    if (navIndex > 3) return navIndex - 1; // Pulse=3, Settings=4
    return 0;
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.charcoal.withValues(alpha: 0.95),
        border: const Border(
          top: BorderSide(
            color: AppColors.slate,
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              icon: Icons.home_rounded,
              label: 'Home',
              index: 0,
            ),
            _buildNavItem(
              icon: Icons.dashboard_rounded,
              label: 'Dashboard',
              index: 1,
            ),
            _buildNavItem(
              icon: Icons.swap_horiz_rounded,
              label: 'Swap',
              index: 2,
            ),
            _buildCenterNavButton(),
            _buildNavItem(
              icon: Icons.flash_on_rounded,
              label: 'Pulse',
              index: 4,
            ),
            _buildNavItem(
              icon: Icons.settings_rounded,
              label: 'Settings',
              index: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTabSelected(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.neonGreen : AppColors.textTertiary,
              size: 26,
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.neonGreen : AppColors.textTertiary,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterNavButton() {
    return GestureDetector(
      onTap: () => _onTabSelected(3),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.neonGreen,
          boxShadow: [
            BoxShadow(
              color: AppColors.neonGreen.withValues(alpha: 0.4),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(
          Icons.qr_code_scanner_rounded,
          color: AppColors.abyss,
          size: 28,
        ),
      ),
    );
  }
}

