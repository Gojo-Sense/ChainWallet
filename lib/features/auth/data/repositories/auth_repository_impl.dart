import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/token_storage_service.dart';
import '../../domain/failures/auth_failure.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/auth_api.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl(this._api, this._tokenStorage);

  final AuthApi _api;
  final TokenStorageService _tokenStorage;

  @override
  Future<Either<AuthFailure, Map<String, dynamic>>> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _api.register(email: email, password: password);
      
      if (response.success && response.data != null) {
        // Save tokens
        await _tokenStorage.saveAccessToken(response.data!.accessToken);
        await _tokenStorage.saveRefreshToken(response.data!.refreshToken);
        
        // Save user
        final userJson = response.data!.user.toJson();
        await _tokenStorage.saveUser(userJson.toString());
        
        return right({
          'user': response.data!.user.toEntity(),
          'accessToken': response.data!.accessToken,
          'refreshToken': response.data!.refreshToken,
        });
      } else {
        return left(AuthFailure.serverError(
          message: response.message ?? 'Registration failed',
        ));
      }
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left(AuthFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _api.login(email: email, password: password);
      
      if (response.success && response.data != null) {
        // Save tokens
        await _tokenStorage.saveAccessToken(response.data!.accessToken);
        await _tokenStorage.saveRefreshToken(response.data!.refreshToken);
        
        // Save user
        final userJson = response.data!.user.toJson();
        await _tokenStorage.saveUser(userJson.toString());
        
        return right({
          'user': response.data!.user.toEntity(),
          'accessToken': response.data!.accessToken,
          'refreshToken': response.data!.refreshToken,
        });
      } else {
        return left(AuthFailure.serverError(
          message: response.message ?? 'Login failed',
        ));
      }
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left(AuthFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, void>> logout() async {
    try {
      final refreshToken = await _tokenStorage.getRefreshToken();
      if (refreshToken != null) {
        await _api.logout(refreshToken);
      }
      await _tokenStorage.clearAll();
      return right(null);
    } on DioException catch (e) {
      // Even if logout fails on server, clear local storage
      await _tokenStorage.clearAll();
      return left(_handleDioError(e));
    } catch (e) {
      await _tokenStorage.clearAll();
      return left(AuthFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, String>> refreshToken(String refreshToken) async {
    try {
      final response = await _api.refreshToken(refreshToken);
      
      if (response.success && response.data != null) {
        await _tokenStorage.saveAccessToken(response.data!.accessToken);
        if (response.data!.refreshToken.isNotEmpty) {
          await _tokenStorage.saveRefreshToken(response.data!.refreshToken);
        }
        return right(response.data!.accessToken);
      } else {
        return left(AuthFailure.serverError(
          message: response.message ?? 'Token refresh failed',
        ));
      }
    } on DioException catch (e) {
      return left(_handleDioError(e));
    } catch (e) {
      return left(AuthFailure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, bool>> isAuthenticated() async {
    try {
      final token = await _tokenStorage.getAccessToken();
      if (token == null) return right(false);
      
      // Basic token expiration check
      try {
        final parts = token.split('.');
        if (parts.length != 3) return right(false);
        
        final payload = parts[1];
        final normalized = base64.normalize(payload);
        final decoded = utf8.decode(base64.decode(normalized));
        final json = jsonDecode(decoded) as Map<String, dynamic>;
        
        final exp = json['exp'] as int?;
        if (exp != null) {
          final expirationDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
          if (DateTime.now().isAfter(expirationDate)) {
            await _tokenStorage.clearAll();
            return right(false);
          }
        }
        
        return right(true);
      } catch (e) {
        return right(false);
      }
    } catch (e) {
      return left(AuthFailure.unknown(message: e.toString()));
    }
  }

  AuthFailure _handleDioError(DioException error) {
    if (error.response != null) {
      final statusCode = error.response!.statusCode;
      final message = error.response?.data?['message'] ?? 
                     error.response?.data?['error'] ?? 
                     'An error occurred';
      
      switch (statusCode) {
        case 400:
          return AuthFailure.badRequest(message: message);
        case 401:
          return AuthFailure.unauthorized(message: message);
        case 404:
          return AuthFailure.notFound(message: message);
        case 500:
          return AuthFailure.serverError(message: message);
        default:
          return AuthFailure.serverError(message: message);
      }
    } else if (error.type == DioExceptionType.connectionTimeout ||
               error.type == DioExceptionType.receiveTimeout) {
      return AuthFailure.networkError(message: 'Connection timeout');
    } else if (error.type == DioExceptionType.connectionError) {
      return AuthFailure.networkError(message: 'No internet connection');
    } else {
      return AuthFailure.unknown(message: error.message ?? 'Unknown error');
    }
  }
}

