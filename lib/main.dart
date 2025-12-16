// ============================================================================
// FILE: main.dart
// PURPOSE: Application entry point for AetherWallet
// ARCHITECTURE: Clean Architecture with BLoC, Freezed, fpdart
// DESIGN: Deep Glassmorphism with Aether Gradient (Cyan → Purple)
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'core/di/injection.dart';
import 'core/theme/app_theme.dart';
import 'core/services/lock_service.dart';
import 'core/services/websocket_service.dart'; // Fixed import for WebSocketService
import 'features/alerts/domain/services/alert_checker_service.dart';
import 'config/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive for local database
  await Hive.initFlutter();
  
  // Open Hive boxes (using simple key-value storage, not typed adapters)
  // Boxes will be opened lazily in repositories if needed
  // Pre-opening for better performance
  try {
    await Hive.openBox('transactions');
    await Hive.openBox('portfolio_snapshots');
    await Hive.openBox('market_cache');
    await Hive.openBox('nft_cache');
    await Hive.openBox('app_preferences');
  } catch (e) {
    // Boxes might already be open, continue
  }

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set system UI overlay style for immersive dark experience
  SystemChrome.setSystemUIOverlayStyle(AetherTheme.systemOverlay);

  // Enable edge-to-edge mode
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );

  // Initialize dependency injection
  configureDependencies();

  // Initialize alert checking service
  final alertCheckerService = getIt<AlertCheckerService>();
  alertCheckerService.startPeriodicChecking(); // Start periodic alert checking
  
  // Initialize WebSocket service
  final webSocketService = getIt<WebSocketService>();
  // Note: WebSocket will connect when user authenticates

  runApp(const AetherWalletApp());
}

/// Root application widget
class AetherWalletApp extends StatefulWidget {
  const AetherWalletApp({super.key});

  @override
  State<AetherWalletApp> createState() => _AetherWalletAppState();
}

class _AetherWalletAppState extends State<AetherWalletApp> 
    with WidgetsBindingObserver {
  final LockService _lockService = getIt<LockService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _checkLockState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Check if app should be locked when coming to foreground
      _checkLockState();
    } else if (state == AppLifecycleState.paused) {
      // App going to background - don't lock immediately
      // Lock will be checked when app resumes
    }
  }

  Future<void> _checkLockState() async {
    final shouldLock = await _lockService.shouldLock();
    if (shouldLock && mounted) {
      final router = GoRouter.of(context);
      final currentPath = router.routeInformationProvider.value.uri.path;
      
      // Only navigate to lock if not already there and not on splash/onboarding
      if (currentPath != '/lock' && 
          currentPath != '/splash' && 
          currentPath != '/onboarding') {
        router.go('/lock');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aether Wallet',
      debugShowCheckedModeBanner: false,

      // Theme configuration - Deep Glassmorphism
      theme: AetherTheme.dark,
      darkTheme: AetherTheme.dark,
      themeMode: ThemeMode.dark,

      // Router configuration
      routerConfig: AppRouter.router,

      // Builder for global configuration
      builder: (context, child) {
        return MediaQuery(
          // Prevent system text scaling from affecting layout
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
