// ============================================================================
// FILE: send_crypto_page.dart
// PURPOSE: Send crypto page for sending tokens
// DESIGN: Deep Glassmorphism with send interface
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/glass_card.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../../../core/di/injection.dart';
import '../../../transactions/domain/entities/transaction_entity.dart';
import '../../../transactions/domain/repositories/i_transaction_repository.dart';
import '../bloc/wallet_bloc.dart';

class SendCryptoPage extends StatefulWidget {
  const SendCryptoPage({super.key});

  @override
  State<SendCryptoPage> createState() => _SendCryptoPageState();
}

class _SendCryptoPageState extends State<SendCryptoPage> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();
  String _selectedToken = 'ETH';
  bool _isSending = false;

  @override
  void dispose() {
    _addressController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _handleSend() async {
    if (!_formKey.currentState!.validate()) return;

    HapticFeedback.mediumImpact();
    setState(() => _isSending = true);

    try {
      // Get wallet address
      final walletState = context.read<WalletBloc>().state;
      final wallet = walletState.maybeWhen(
        walletLoaded: (w) => w,
        walletCreated: (w) => w,
        orElse: () => null,
      );

      if (wallet == null) {
        _showError('Wallet not loaded');
        return;
      }

      final amount = double.parse(_amountController.text);
      final toAddress = _addressController.text.trim();
      final note = _noteController.text.trim();

      // Simulate transaction (in real app, this would use Web3 service)
      await Future.delayed(const Duration(seconds: 2));

      // Generate mock transaction hash
      final txHash = '0x${const Uuid().v4().replaceAll('-', '').substring(0, 64)}';

      // Save transaction to history
      final transactionRepository = getIt<ITransactionRepository>();
      final transaction = Transaction(
        id: const Uuid().v4(),
        hash: txHash,
        type: TransactionType.send,
        status: TransactionStatus.pending,
        timestamp: DateTime.now(),
        fromAddress: wallet.address,
        toAddress: toAddress,
        amount: amount,
        token: _selectedToken,
        gasFee: 0.001, // Mock gas fee
        note: note.isNotEmpty ? note : null,
      );

      await transactionRepository.saveTransaction(transaction);

      // Show success
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: AppColors.success),
                const SizedBox(width: 12),
                Text(
                  'Sent ${amount.toStringAsFixed(4)} $_selectedToken',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            backgroundColor: AppColors.charcoal,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );

        // Navigate back
        context.pop();
      }
    } catch (e) {
      _showError('Failed to send: $e');
    } finally {
      if (mounted) {
        setState(() => _isSending = false);
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: AppColors.error),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: AppColors.charcoal,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.abyss,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.5, -0.5),
            radius: 1.5,
            colors: [
              AppColors.cyan.withAlpha(10),
              AppColors.abyss,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: AppSpacing.screenPadding,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTokenSelector(),
                        const SizedBox(height: AppSpacing.lg),
                        _buildAddressField(),
                        const SizedBox(height: AppSpacing.lg),
                        _buildAmountField(),
                        const SizedBox(height: AppSpacing.lg),
                        _buildNoteField(),
                        const SizedBox(height: AppSpacing.xl),
                        _buildSendButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.glassBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Send Crypto',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2, end: 0);
  }

  Widget _buildTokenSelector() {
    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Token',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          DropdownButtonFormField<String>(
            value: _selectedToken,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.glassBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.glassBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.cyan, width: 2),
              ),
              contentPadding: const EdgeInsets.all(AppSpacing.md),
            ),
            dropdownColor: AppColors.charcoal,
            style: AppTypography.titleMedium,
            items: ['ETH', 'BTC', 'USDC', 'USDT', 'DAI'].map((token) {
              return DropdownMenuItem(
                value: token,
                child: Text(token),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedToken = value);
              }
            },
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms);
  }

  Widget _buildAddressField() {
    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipient Address',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextFormField(
            controller: _addressController,
            style: AppTypography.bodyLarge,
            decoration: InputDecoration(
              hintText: '0x...',
              hintStyle: AppTypography.bodyMedium.copyWith(
                color: AppColors.textTertiary,
              ),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.glassBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.glassBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.cyan, width: 2),
              ),
              contentPadding: const EdgeInsets.all(AppSpacing.md),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Address is required';
              }
              if (!value.startsWith('0x') || value.length != 42) {
                return 'Invalid Ethereum address';
              }
              return null;
            },
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms);
  }

  Widget _buildAmountField() {
    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amount',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextFormField(
            controller: _amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: AppTypography.headlineMedium,
            decoration: InputDecoration(
              hintText: '0.00',
              hintStyle: AppTypography.headlineMedium.copyWith(
                color: AppColors.textMuted,
              ),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.glassBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.glassBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.cyan, width: 2),
              ),
              contentPadding: const EdgeInsets.all(AppSpacing.md),
              suffixText: _selectedToken,
              suffixStyle: AppTypography.titleMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Amount is required';
              }
              final amount = double.tryParse(value);
              if (amount == null || amount <= 0) {
                return 'Invalid amount';
              }
              return null;
            },
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms);
  }

  Widget _buildNoteField() {
    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Note (Optional)',
            style: AppTypography.labelMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextFormField(
            controller: _noteController,
            maxLines: 3,
            style: AppTypography.bodyLarge,
            decoration: InputDecoration(
              hintText: 'Add a note...',
              hintStyle: AppTypography.bodyMedium.copyWith(
                color: AppColors.textTertiary,
              ),
              filled: true,
              fillColor: Colors.white.withValues(alpha: 0.05),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.glassBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.glassBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.cyan, width: 2),
              ),
              contentPadding: const EdgeInsets.all(AppSpacing.md),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 400.ms);
  }

  Widget _buildSendButton() {
    return NeonButton(
      onPressed: _isSending ? null : _handleSend,
      label: _isSending ? 'Sending...' : 'Send',
      isLoading: _isSending,
    ).animate().fadeIn(delay: 500.ms);
  }
}





