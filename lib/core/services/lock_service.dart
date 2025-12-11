// ============================================================================
// FILE: lock_service.dart
// PURPOSE: Manage app lock state and biometric preferences
// ============================================================================

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LockService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  
  static const String _biometricsEnabledKey = 'biometrics_enabled';
  static const String _lastUnlockTimeKey = 'last_unlock_time';
  static const String _lockTimeoutKey = 'lock_timeout_minutes';
  
  /// Check if biometrics are enabled
  Future<bool> isBiometricsEnabled() async {
    try {
      final value = await _storage.read(key: _biometricsEnabledKey);
      return value == 'true';
    } catch (e) {
      return false;
    }
  }
  
  /// Enable or disable biometrics
  Future<void> setBiometricsEnabled(bool enabled) async {
    try {
      await _storage.write(
        key: _biometricsEnabledKey,
        value: enabled.toString(),
      );
    } catch (e) {
      // Handle error silently
    }
  }
  
  /// Save the current time as last unlock time
  Future<void> saveUnlockTime() async {
    try {
      final now = DateTime.now().millisecondsSinceEpoch.toString();
      await _storage.write(key: _lastUnlockTimeKey, value: now);
    } catch (e) {
      // Handle error silently
    }
  }
  
  /// Check if app should be locked (based on timeout)
  Future<bool> shouldLock() async {
    try {
      final biometricsEnabled = await isBiometricsEnabled();
      if (!biometricsEnabled) return false;
      
      final lastUnlockStr = await _storage.read(key: _lastUnlockTimeKey);
      if (lastUnlockStr == null) return true; // Never unlocked, should lock
      
      final lastUnlock = DateTime.fromMillisecondsSinceEpoch(
        int.parse(lastUnlockStr),
      );
      
      final timeoutStr = await _storage.read(key: _lockTimeoutKey);
      final timeoutMinutes = timeoutStr != null ? int.parse(timeoutStr) : 5;
      
      final now = DateTime.now();
      final difference = now.difference(lastUnlock);
      
      return difference.inMinutes >= timeoutMinutes;
    } catch (e) {
      return false; // On error, don't lock
    }
  }
  
  /// Set lock timeout in minutes
  Future<void> setLockTimeout(int minutes) async {
    try {
      await _storage.write(
        key: _lockTimeoutKey,
        value: minutes.toString(),
      );
    } catch (e) {
      // Handle error silently
    }
  }
  
  /// Get lock timeout in minutes
  Future<int> getLockTimeout() async {
    try {
      final value = await _storage.read(key: _lockTimeoutKey);
      return value != null ? int.parse(value) : 5; // Default 5 minutes
    } catch (e) {
      return 5;
    }
  }
  
  /// Clear unlock time (force lock on next check)
  Future<void> clearUnlockTime() async {
    try {
      await _storage.delete(key: _lastUnlockTimeKey);
    } catch (e) {
      // Handle error silently
    }
  }
}




