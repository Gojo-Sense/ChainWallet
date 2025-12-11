import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/interceptors/auth_interceptor.dart';
import '../models/auth_model.dart';

@lazySingleton
class AuthApi {
  AuthApi(this._authInterceptor) {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    )..interceptors.add(_authInterceptor);
  }

  late final Dio _dio;
  final AuthInterceptor _authInterceptor;

  /// Register a new user
  Future<AuthResponseModel> register({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '${ApiEndpoints.baseUrl}${ApiEndpoints.register}',
      data: {
        'email': email,
        'password': password,
      },
    );
    return AuthResponseModel.fromJson(response.data);
  }

  /// Login user
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '${ApiEndpoints.baseUrl}${ApiEndpoints.login}',
      data: {
        'email': email,
        'password': password,
      },
    );
    return AuthResponseModel.fromJson(response.data);
  }

  /// Logout user
  Future<void> logout(String refreshToken) async {
    await _dio.post(
      '${ApiEndpoints.baseUrl}${ApiEndpoints.logout}',
      data: {'refreshToken': refreshToken},
    );
  }

  /// Refresh access token
  Future<AuthResponseModel> refreshToken(String refreshToken) async {
    final response = await _dio.post(
      '${ApiEndpoints.baseUrl}${ApiEndpoints.refresh}',
      data: {'refreshToken': refreshToken},
    );
    return AuthResponseModel.fromJson(response.data);
  }
}

