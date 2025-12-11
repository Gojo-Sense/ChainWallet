// ============================================================================
// FILE: create_alert_sheet.dart
// PURPOSE: Bottom sheet for creating new price alerts
// DESIGN: Glass modal with token selector
// ============================================================================

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/alert_entity.dart';
import '../bloc/alert_bloc.dart';
import '../bloc/alert_event.dart';

class CreateAlertSheet extends StatefulWidget {
  const CreateAlertSheet({super.key});

  @override
  State<CreateAlertSheet> createState() => _CreateAlertSheetState();
}

class _CreateAlertSheetState extends State<CreateAlertSheet> {
  final TextEditingController _priceController = TextEditingController();
  
  String _selectedTokenId = 'bitcoin';
  String _selectedTokenName = 'Bitcoin';
  String _selectedTokenSymbol = 'BTC';
  double _currentPrice = 98500;
  AlertCondition _condition = AlertCondition.above;

  final List<Map<String, dynamic>> _tokens = [
    {'id': 'bitcoin', 'name': 'Bitcoin', 'symbol': 'BTC', 'price': 98500.0},
    {'id': 'ethereum', 'name': 'Ethereum', 'symbol': 'ETH', 'price': 3680.0},
    {'id': 'solana', 'name': 'Solana', 'symbol': 'SOL', 'price': 225.0},
    {'id': 'dogecoin', 'name': 'Dogecoin', 'symbol': 'DOGE', 'price': 0.42},
    {'id': 'cardano', 'name': 'Cardano', 'symbol': 'ADA', 'price': 1.08},
  ];

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  void _createAlert() {
    final targetPrice = double.tryParse(_priceController.text);
    if (targetPrice == null || targetPrice <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid price'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    HapticFeedback.mediumImpact();
    
    context.read<AlertBloc>().add(AlertEvent.createAlert(
      tokenId: _selectedTokenId,
      tokenName: _selectedTokenName,
      tokenSymbol: _selectedTokenSymbol,
      targetPrice: targetPrice,
      currentPrice: _currentPrice,
      condition: _condition,
    ));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.glassBg,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              border: Border.all(color: AppColors.glassBorder),
            ),
            child: Column(
              children: [
                // Handle
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(60),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                // Title
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Text(
                        'Create Price Alert',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          color: Colors.white.withAlpha(150),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Token selector
                        Text(
                          'Select Token',
                          style: TextStyle(
                            color: Colors.white.withAlpha(150),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildTokenSelector(),

                        const SizedBox(height: 24),

                        // Condition selector
                        Text(
                          'Alert When Price Goes',
                          style: TextStyle(
                            color: Colors.white.withAlpha(150),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildConditionSelector(),

                        const SizedBox(height: 24),

                        // Target price
                        Text(
                          'Target Price (USD)',
                          style: TextStyle(
                            color: Colors.white.withAlpha(150),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildPriceInput(),

                        const SizedBox(height: 16),

                        // Current price reference
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(10),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.white.withAlpha(100),
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Current price: \$${_currentPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white.withAlpha(150),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Create button
                        _buildCreateButton(),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTokenSelector() {
    return Container(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _tokens.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final token = _tokens[index];
          final isSelected = token['id'] == _selectedTokenId;
          
          return GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              setState(() {
                _selectedTokenId = token['id'] as String;
                _selectedTokenName = token['name'] as String;
                _selectedTokenSymbol = token['symbol'] as String;
                _currentPrice = token['price'] as double;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 100,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: isSelected ? AppColors.aetherGradient : null,
                color: isSelected ? null : AppColors.glassBg,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : AppColors.glassBorder,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.neonCyan.withAlpha(40),
                          blurRadius: 12,
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    token['symbol'] as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${(token['price'] as double).toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.white.withAlpha(150),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildConditionSelector() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              setState(() => _condition = AlertCondition.above);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: _condition == AlertCondition.above
                    ? AppColors.success.withAlpha(40)
                    : AppColors.glassBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: _condition == AlertCondition.above
                      ? AppColors.success
                      : AppColors.glassBorder,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.trending_up,
                    color: _condition == AlertCondition.above
                        ? AppColors.success
                        : Colors.white.withAlpha(150),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Above',
                    style: TextStyle(
                      color: _condition == AlertCondition.above
                          ? AppColors.success
                          : Colors.white.withAlpha(150),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              setState(() => _condition = AlertCondition.below);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: _condition == AlertCondition.below
                    ? AppColors.error.withAlpha(40)
                    : AppColors.glassBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: _condition == AlertCondition.below
                      ? AppColors.error
                      : AppColors.glassBorder,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.trending_down,
                    color: _condition == AlertCondition.below
                        ? AppColors.error
                        : Colors.white.withAlpha(150),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Below',
                    style: TextStyle(
                      color: _condition == AlertCondition.below
                          ? AppColors.error
                          : Colors.white.withAlpha(150),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceInput() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.glassBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: TextField(
        controller: _priceController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          prefixText: '\$ ',
          prefixStyle: TextStyle(
            color: Colors.white.withAlpha(150),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          hintText: '0.00',
          hintStyle: TextStyle(
            color: Colors.white.withAlpha(60),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildCreateButton() {
    return GestureDetector(
      onTap: _createAlert,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: AppColors.aetherGradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.neonCyan.withAlpha(60),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_active, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Create Alert',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


