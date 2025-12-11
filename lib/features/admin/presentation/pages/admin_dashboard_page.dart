// ============================================================================
// FILE: admin_dashboard_page.dart
// PURPOSE: WebView page to load Angular Admin Dashboard
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

// Only import webview_flutter on non-web platforms
// On web, this import will fail, but kIsWeb check prevents usage
import 'package:webview_flutter/webview_flutter.dart' 
    if (dart.library.html) 'webview_web_stub.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/neon_button.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  dynamic _controller; // WebViewController only on mobile
  bool _isLoading = false;
  String? _error;
  bool? _serverStatus; // null = unknown, true = online, false = offline
  bool _isCheckingServer = false;

  // Angular Dashboard URL
  static const String angularDashboardUrl = 'http://localhost:4200';

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _initializeWebView();
    } else {
      _isLoading = false;
      // Check server status on web platform
      _checkServerStatus();
    }
  }

  void _initializeWebView() {
    if (kIsWeb) return; // Don't initialize on web
    
    try {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(AppColors.abyss)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (String url) {
              if (mounted) {
                setState(() {
                  _isLoading = true;
                  _error = null;
                });
              }
            },
            onPageFinished: (String url) {
              if (mounted) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
            onWebResourceError: (WebResourceError error) {
              if (mounted) {
                setState(() {
                  _isLoading = false;
                  _error = error.description;
                });
              }
            },
          ),
        )
        ..loadRequest(Uri.parse(angularDashboardUrl));
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  /// Check if Angular server is running and accessible
  Future<bool> _checkServerStatus() async {
    if (!mounted) return false;
    
    setState(() {
      _isCheckingServer = true;
    });

    try {
      final uri = Uri.parse(angularDashboardUrl);
      final response = await http
          .get(uri)
          .timeout(
            const Duration(seconds: 3),
            onTimeout: () {
              throw Exception('Connection timeout');
            },
          );

      final isOnline = response.statusCode >= 200 && response.statusCode < 500;
      
      if (mounted) {
        setState(() {
          _serverStatus = isOnline;
          _isCheckingServer = false;
        });
      }
      
      return isOnline;
    } catch (e) {
      if (mounted) {
        setState(() {
          _serverStatus = false;
          _isCheckingServer = false;
        });
      }
      return false;
    }
  }

  Future<void> _openInNewTab() async {
    // First check if server is online
    if (kIsWeb) {
      final isOnline = await _checkServerStatus();
      
      if (!isOnline) {
        _showServerOfflineDialog();
        return;
      }
    }

    try {
      final uri = Uri.parse(angularDashboardUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not open $angularDashboardUrl'),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        _showServerOfflineDialog();
      }
    }
  }

  void _showServerOfflineDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.charcoal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Icon(Icons.error_outline_rounded, color: AppColors.error),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Angular Server Not Running',
                style: AppTypography.headlineSmall.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Angular development server is not running on port 4200.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'To start the server:',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.neonGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.abyss,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.glassBorder,
                    width: 1,
                  ),
                ),
                child: SelectableText(
                  'cd web-admin\nnpm start',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.neonGreen,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Or use the startup script:',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.neonGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.abyss,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.glassBorder,
                    width: 1,
                  ),
                ),
                child: SelectableText(
                  './start_dev.sh',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.neonGreen,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Once the server is running, try again.',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _checkServerStatus();
            },
            child: Text(
              'Check Again',
              style: TextStyle(color: AppColors.neonGreen),
            ),
          ),
        ],
      ),
    );
  }

  void _reload() {
    if (kIsWeb) return;
    
    setState(() {
      _error = null;
      _isLoading = true;
    });
    
    if (_controller != null) {
      try {
        _controller.reload();
      } catch (e) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            _buildAppBar(),

            // Content
            Expanded(
              child: kIsWeb
                  ? _buildWebView()
                  : _buildMobileView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileView() {
    if (_controller == null) {
      return _buildErrorView('WebView not initialized');
    }

    return Stack(
      children: [
        // WebView - only on mobile
        WebViewWidget(controller: _controller as WebViewController),

        // Loading Indicator
        if (_isLoading && _error == null)
          Container(
            color: AppColors.abyss,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: AppColors.neonGreen,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Loading Admin Dashboard...',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Error State
        if (_error != null) _buildErrorContent(),
      ],
    );
  }

  Widget _buildWebView() {
    // For web, show button to open in new tab
    return Container(
      color: AppColors.abyss,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.dashboard_rounded,
                size: 80,
                color: AppColors.neonGreen.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 24),
              Text(
                'Admin Dashboard',
                style: AppTypography.headlineMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Click below to open the Angular dashboard\nin a new browser tab',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Server Status Indicator
              _buildServerStatusIndicator(),
              const SizedBox(height: 24),
              NeonButton(
                label: 'Open Dashboard',
                onPressed: _isCheckingServer ? null : _openInNewTab,
                icon: Icons.open_in_new_rounded,
                isDisabled: _isCheckingServer,
                isLoading: _isCheckingServer,
              ),
              const SizedBox(height: 32),
              GlassCard(
                blur: 15,
                opacity: 0.1,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: AppColors.neonGreen,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Information',
                          style: AppTypography.labelMedium.copyWith(
                            color: AppColors.neonGreen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('URL:', angularDashboardUrl),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      'Status:',
                      _serverStatus == null
                          ? 'Unknown'
                          : (_serverStatus! ? 'Online' : 'Offline'),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Make sure Angular dev server is running',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 60,
          child: Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServerStatusIndicator() {
    if (_isCheckingServer) {
      return GlassCard(
        blur: 15,
        opacity: 0.1,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.neonGreen,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Checking server status...',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    final isOnline = _serverStatus == true;
    final statusColor = isOnline ? AppColors.neonGreen : AppColors.error;
    final statusText = _serverStatus == null
        ? 'Status Unknown'
        : (isOnline ? 'Server Online' : 'Server Offline');

    return GlassCard(
      blur: 15,
      opacity: 0.1,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: statusColor.withValues(alpha: 0.5),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            statusText,
            style: AppTypography.bodySmall.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              Icons.refresh_rounded,
              size: 18,
              color: AppColors.textSecondary,
            ),
            onPressed: _checkServerStatus,
            tooltip: 'Check server status',
          ),
        ],
      ),
    );
  }

  Widget _buildErrorContent() {
    return Container(
      color: AppColors.abyss,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load dashboard',
              style: AppTypography.headlineSmall.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _error ?? 'Unknown error',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            if (!kIsWeb)
              GlassCard(
                blur: 15,
                opacity: 0.1,
                onTap: _reload,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: Text(
                    'Retry',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.neonGreen,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              'Make sure Angular dev server is running on port 4200',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textMuted,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView(String message) {
    return Container(
      color: AppColors.abyss,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            GlassCard(
              blur: 15,
              opacity: 0.1,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Text(
                  'Go Back',
                  style: AppTypography.titleMedium.copyWith(
                    color: AppColors.neonGreen,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.abyss,
        border: Border(
          bottom: BorderSide(
            color: AppColors.glassBorder.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Back Button
          GlassCard(
            blur: 10,
            opacity: 0.1,
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.textPrimary,
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin Dashboard',
                  style: AppTypography.headlineSmall.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  kIsWeb ? 'Open in New Tab' : 'Analytics & Statistics',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          // Reload Button (only for mobile)
          if (!kIsWeb && _controller != null)
            GlassCard(
              blur: 10,
              opacity: 0.1,
              borderRadius: BorderRadius.circular(12),
              onTap: _reload,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  _isLoading ? Icons.refresh : Icons.refresh_outlined,
                  color: _isLoading ? AppColors.neonGreen : AppColors.textPrimary,
                  size: 22,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
