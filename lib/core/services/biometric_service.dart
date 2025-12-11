// ============================================================================
// FILE: biometric_service.dart
// PURPOSE: Handle biometric authentication (FaceID, TouchID, Fingerprint)
// PATTERN: Service class with fpdart Either for error handling
// ============================================================================

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:local_auth/local_auth.dart';
import 'package:injectable/injectable.dart';

/// Biometric authentication failure types
sealed class BiometricFailure {
  const BiometricFailure();
  String get message;
}

class BiometricNotAvailable extends BiometricFailure {
  const BiometricNotAvailable();
  @override
  String get message => 'Biometric authentication is not available on this device';
}

class BiometricNotEnrolled extends BiometricFailure {
  const BiometricNotEnrolled();
  @override
  String get message => 'No biometrics enrolled. Please set up fingerprint or face recognition';
}

class BiometricLockout extends BiometricFailure {
  const BiometricLockout();
  @override
  String get message => 'Too many failed attempts. Please try again later';
}

class BiometricCancelled extends BiometricFailure {
  const BiometricCancelled();
  @override
  String get message => 'Authentication was cancelled';
}

class BiometricError extends BiometricFailure {
  final String details;
  const BiometricError(this.details);
  @override
  String get message => 'Authentication failed: $details';
}

/// Service for handling biometric authentication
@lazySingleton
class BiometricService {
  final LocalAuthentication _auth = LocalAuthentication();

  /// Check if device supports biometrics
  Future<bool> isDeviceSupported() async {
    try {
      // Skip on web
      if (kIsWeb) return false;
      return await _auth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }

  /// Check if biometrics can be checked (device has hardware + biometrics enrolled)
  Future<bool> canCheckBiometrics() async {
    try {
      if (kIsWeb) return false;
      return await _auth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  /// Get available biometric types on this device
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      if (kIsWeb) return [];
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      return [];
    }
  }

  /// Check if biometric authentication is available
  Future<Either<BiometricFailure, bool>> isBiometricAvailable() async {
    try {
      if (kIsWeb) {
        return left(const BiometricNotAvailable());
      }

      final isSupported = await _auth.isDeviceSupported();
      if (!isSupported) {
        return left(const BiometricNotAvailable());
      }

      final canCheck = await _auth.canCheckBiometrics;
      if (!canCheck) {
        return left(const BiometricNotEnrolled());
      }

      final availableBiometrics = await _auth.getAvailableBiometrics();
      if (availableBiometrics.isEmpty) {
        return left(const BiometricNotEnrolled());
      }

      return right(true);
    } catch (e) {
      return left(BiometricError(e.toString()));
    }
  }

  /// Authenticate user with biometrics
  Future<Either<BiometricFailure, bool>> authenticate({
    String reason = 'Authenticate to access Aether Wallet',
    bool biometricOnly = false,
  }) async {
    try {
      // On web, show a delay to simulate authentication
      if (kIsWeb) {
        await Future.delayed(const Duration(milliseconds: 800));
        // For web, we'll return success but log it
        debugPrint('Web: Biometric authentication simulated (always succeeds)');
        return right(true);
      }

      final didAuthenticate = await _auth.authenticate(
        localizedReason: reason,
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: biometricOnly,
          sensitiveTransaction: true,
        ),
      );

      if (didAuthenticate) {
        return right(true);
      } else {
        return left(const BiometricCancelled());
      }
    } catch (e) {
      final errorString = e.toString().toLowerCase();
      
      if (errorString.contains('locked') || errorString.contains('lockout')) {
        return left(const BiometricLockout());
      }
      if (errorString.contains('cancel')) {
        return left(const BiometricCancelled());
      }
      if (errorString.contains('not available') || errorString.contains('not enrolled')) {
        return left(const BiometricNotAvailable());
      }
      
      return left(BiometricError(e.toString()));
    }
  }

  /// Get friendly name for biometric type
  String getBiometricTypeName(BiometricType type) {
    switch (type) {
      case BiometricType.face:
        return 'Face ID';
      case BiometricType.fingerprint:
        return 'Fingerprint';
      case BiometricType.iris:
        return 'Iris Scanner';
      case BiometricType.strong:
        return 'Biometric';
      case BiometricType.weak:
        return 'Biometric';
    }
  }
}


