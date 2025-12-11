import 'package:fpdart/fpdart.dart';
import '../failures/auth_failure.dart';

abstract class IAuthRepository {
  /// Register a new user
  Future<Either<AuthFailure, Map<String, dynamic>>> register({
    required String email,
    required String password,
  });

  /// Login user
  Future<Either<AuthFailure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });

  /// Logout user
  Future<Either<AuthFailure, void>> logout();

  /// Refresh access token
  Future<Either<AuthFailure, String>> refreshToken(String refreshToken);

  /// Check if user is authenticated
  Future<Either<AuthFailure, bool>> isAuthenticated();
}

