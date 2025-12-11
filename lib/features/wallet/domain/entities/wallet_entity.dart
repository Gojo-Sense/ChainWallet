// ============================================================================
// FILE: wallet_entity.dart
// PURPOSE: Core wallet entity for the domain layer
// NOTE: Pure Dart - NO Flutter imports
// ============================================================================

import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_entity.freezed.dart';

/// Represents a crypto wallet in the domain layer
@freezed
sealed class WalletEntity with _$WalletEntity {
  const WalletEntity._();

  const factory WalletEntity({
    required String address,
    required String mnemonic,
    @Default(false) bool isImported,
    DateTime? createdAt,
  }) = _WalletEntity;

  /// Returns masked mnemonic for display (first 3 words + ...)
  String get maskedMnemonic {
    final words = mnemonic.split(' ');
    if (words.length <= 3) return mnemonic;
    return '${words.take(3).join(' ')} ...';
  }

  /// Returns words as a list for seed phrase display
  List<String> get words => mnemonic.split(' ');

  /// Returns shortened address for display
  String get shortAddress {
    if (address.length <= 10) return address;
    return '${address.substring(0, 6)}...${address.substring(address.length - 4)}';
  }
}
