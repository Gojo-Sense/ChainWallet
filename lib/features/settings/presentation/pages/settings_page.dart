// ============================================================================
// FILE: settings_page.dart
// PURPOSE: Settings page with profile, security, preferences
// DESIGN: Deep Glassmorphism with sectioned settings
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/avatar_3d.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/services/lock_service.dart';
import '../../../wallet/presentation/bloc/wallet_bloc.dart';
import '../widgets/settings_section.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final LockService _lockService = getIt<LockService>();
  bool _biometricsEnabled = false;
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = true;
  String _selectedCurrency = 'USD';

  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(const WalletEvent.loadWallet());
    _loadBiometricSetting();
  }

  Future<void> _loadBiometricSetting() async {
    final enabled = await _lockService.isBiometricsEnabled();
    setState(() {
      _biometricsEnabled = enabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A120A),
              AppColors.abyss,
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // App Bar
              SliverToBoxAdapter(
                child: _buildAppBar()
                    .animate()
                    .fadeIn(duration: 400.ms),
              ),

              // Profile Card
              SliverToBoxAdapter(
                child: _buildProfileCard()
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 500.ms)
                    .slideY(begin: 0.1, end: 0),
              ),

              // Security Section
              SliverToBoxAdapter(
                child: _buildSecuritySection()
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 400.ms),
              ),

              // Preferences Section
              SliverToBoxAdapter(
                child: _buildPreferencesSection()
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 400.ms),
              ),

              // About Section
              SliverToBoxAdapter(
                child: _buildAboutSection()
                    .animate()
                    .fadeIn(delay: 400.ms, duration: 400.ms),
              ),

              // Danger Zone
              SliverToBoxAdapter(
                child: _buildDangerZone()
                    .animate()
                    .fadeIn(delay: 500.ms, duration: 400.ms),
              ),

              // App Version
              SliverToBoxAdapter(
                child: _buildAppVersion()
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 400.ms),
              ),

              const SliverToBoxAdapter(
                child: SizedBox(height: 120),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Row(
        children: [
          Text(
            'Settings',
            style: AppTypography.displaySmall,
          ),
          const SizedBox(width: 8),
          const Text('⚙️', style: TextStyle(fontSize: 28)),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          String address = '0x4Hlojd87h...9988';
          
          state.maybeWhen(
            walletLoaded: (wallet) {
              address = wallet.shortAddress;
            },
            orElse: () {},
          );

          return GlassCard(
            blur: 15,
            opacity: 0.08,
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Row(
              children: [
                // 3D Avatar with larger size
                const Avatar3D(
                  size: 72,
                  seed: 'aether-settings',
                  style: AvatarStyle.lorelei,
                  enableGlow: true,
                  enableRingAnimation: true,
                  ringWidth: 4,
                ),
                const SizedBox(width: AppSpacing.lg),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Aether User',
                            style: AppTypography.headlineMedium,
                          ),
                          const SizedBox(width: 6),
                          const Text('👑', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          Clipboard.setData(ClipboardData(text: address));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Address copied'),
                              backgroundColor: AppColors.charcoal,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              address,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textTertiary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.copy_rounded,
                              size: 14,
                              color: AppColors.textTertiary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Edit button
                GlassContainer(
                  blur: 10,
                  opacity: 0.1,
                  borderRadius: BorderRadius.circular(10),
                  padding: const EdgeInsets.all(8),
                  onTap: () {
                    HapticFeedback.lightImpact();
                  },
                  child: const Icon(
                    Icons.edit_rounded,
                    color: AppColors.neonGreen,
                    size: 18,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSecuritySection() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: SettingsSection(
        title: '🔐 Security',
        items: [
          SettingsItem(
            icon: Icons.fingerprint_rounded,
            title: 'Biometric Authentication',
            subtitle: 'Use Face ID or fingerprint to unlock 👆',
            trailing: SettingsToggle(
              value: _biometricsEnabled,
              onChanged: (value) async {
                HapticFeedback.lightImpact();
                await _lockService.setBiometricsEnabled(value);
                setState(() => _biometricsEnabled = value);
                
                if (value) {
                  // If enabling, show a message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Biometric authentication enabled. App will lock after 5 minutes of inactivity.',
                      ),
                      backgroundColor: AppColors.neonGreen,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } else {
                  // If disabling, clear lock state
                  await _lockService.clearUnlockTime();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Biometric authentication disabled'),
                      backgroundColor: AppColors.textSecondary,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ),
          SettingsItem(
            icon: Icons.key_rounded,
            title: 'Show Recovery Phrase',
            subtitle: 'View your 12-word seed phrase 🗝️',
            onTap: () {
              _showRecoveryPhraseDialog();
            },
          ),
          SettingsItem(
            icon: Icons.lock_rounded,
            title: 'Change PIN',
            subtitle: 'Update your wallet PIN 🔢',
            onTap: () {
              HapticFeedback.lightImpact();
            },
          ),
          SettingsItem(
            icon: Icons.security_rounded,
            title: 'Auto-Lock',
            subtitle: 'After 5 minutes of inactivity ⏱️',
            onTap: () {
              _showAutoLockOptions();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesSection() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: SettingsSection(
        title: '⚡ Preferences',
        items: [
          SettingsItem(
            icon: Icons.attach_money_rounded,
            title: 'Currency 💵',
            subtitle: _selectedCurrency,
            onTap: () {
              _showCurrencyPicker();
            },
          ),
          SettingsItem(
            icon: Icons.notifications_rounded,
            title: 'Notifications 🔔',
            subtitle: 'Transaction alerts and updates',
            trailing: SettingsToggle(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
              },
            ),
          ),
          SettingsItem(
            icon: Icons.dark_mode_rounded,
            title: 'Dark Mode 🌙',
            subtitle: 'Always on',
            trailing: SettingsToggle(
              value: _darkModeEnabled,
              onChanged: (value) {
                // Dark mode is always on for this design
                HapticFeedback.lightImpact();
              },
            ),
          ),
          SettingsItem(
            icon: Icons.language_rounded,
            title: 'Language 🌍',
            subtitle: 'English',
            onTap: () {
              HapticFeedback.lightImpact();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: SettingsSection(
        title: 'ℹ️ About',
        items: [
          SettingsItem(
            icon: Icons.help_outline_rounded,
            title: 'Help & Support 💬',
            onTap: () {
              HapticFeedback.lightImpact();
            },
          ),
          SettingsItem(
            icon: Icons.privacy_tip_rounded,
            title: 'Privacy Policy 📋',
            onTap: () {
              HapticFeedback.lightImpact();
            },
          ),
          SettingsItem(
            icon: Icons.description_rounded,
            title: 'Terms of Service 📜',
            onTap: () {
              HapticFeedback.lightImpact();
            },
          ),
          SettingsItem(
            icon: Icons.star_rounded,
            title: 'Rate App ⭐',
            onTap: () {
              HapticFeedback.lightImpact();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDangerZone() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: SettingsSection(
        title: '⚠️ Danger Zone',
        items: [
          SettingsItem(
            icon: Icons.logout_rounded,
            title: 'Lock Wallet 🔒',
            isDestructive: false,
            iconColor: AppColors.warning,
            onTap: () {
              HapticFeedback.mediumImpact();
              context.go('/');
            },
          ),
          SettingsItem(
            icon: Icons.delete_forever_rounded,
            title: 'Delete Wallet 🗑️',
            subtitle: 'This action cannot be undone',
            isDestructive: true,
            onTap: () {
              _showDeleteConfirmation();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppVersion() {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Center(
        child: Column(
          children: [
            const Text('💎', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text(
              'Aether Wallet v1.0.0',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Made with 💚',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.neonGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRecoveryPhraseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.charcoal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        ),
        title: Row(
          children: [
            const Icon(Icons.warning_rounded, color: AppColors.warning),
            const SizedBox(width: 12),
            Text(
              'Warning',
              style: AppTypography.headlineSmall,
            ),
          ],
        ),
        content: Text(
          'Your recovery phrase gives full access to your wallet. Never share it with anyone.',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to seed display
            },
            child: Text(
              'Show Phrase',
              style: TextStyle(color: AppColors.neonGreen),
            ),
          ),
        ],
      ),
    );
  }

  void _showAutoLockOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.charcoal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXxl),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Auto-Lock Timer',
              style: AppTypography.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.xl),
            ...[
              ('Immediately', '0'),
              ('1 minute', '1'),
              ('5 minutes', '5'),
              ('15 minutes', '15'),
              ('Never', 'never'),
            ].map((option) => ListTile(
              title: Text(option.$1, style: AppTypography.bodyLarge),
              trailing: option.$2 == '5'
                  ? const Icon(Icons.check, color: AppColors.neonGreen)
                  : null,
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.pop(context);
              },
            )),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  void _showCurrencyPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.charcoal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusXxl),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Currency',
              style: AppTypography.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.xl),
            ...['USD', 'EUR', 'GBP', 'JPY', 'CAD', 'AUD'].map((currency) => ListTile(
              title: Text(currency, style: AppTypography.bodyLarge),
              trailing: currency == _selectedCurrency
                  ? const Icon(Icons.check, color: AppColors.neonGreen)
                  : null,
              onTap: () {
                HapticFeedback.lightImpact();
                setState(() => _selectedCurrency = currency);
                Navigator.pop(context);
              },
            )),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.charcoal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        ),
        title: Row(
          children: [
            const Icon(Icons.delete_forever_rounded, color: AppColors.error),
            const SizedBox(width: 12),
            Text(
              'Delete Wallet?',
              style: AppTypography.headlineSmall,
            ),
          ],
        ),
        content: Text(
          'This will permanently delete your wallet from this device. Make sure you have saved your recovery phrase.',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<WalletBloc>().add(const WalletEvent.deleteWallet());
              context.go('/onboarding');
            },
            child: Text(
              'Delete',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}

