import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../services/token_storage_service.dart';
import '../constants/api_endpoints.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage);

  final TokenStorageService _tokenStorage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Skip auth for login/register endpoints
    if (options.path.contains('/auth/login') || 
        options.path.contains('/auth/register')) {
      return handler.next(options);
    }

    // Add token to request
    final token = await _tokenStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized
    if (err.response?.statusCode == 401 && 
        !err.requestOptions.path.contains('/auth/refresh')) {
      final refreshToken = await _tokenStorage.getRefreshToken();
      
      if (refreshToken != null) {
        try {
          // Try to refresh token
          final dio = Dio();
          final response = await dio.post(
            '${ApiEndpoints.baseUrl}${ApiEndpoints.refresh}',
            data: {'refreshToken': refreshToken},
          );

          if (response.statusCode == 200) {
            final data = response.data as Map<String, dynamic>;
            if (data['success'] == true && data['data'] != null) {
              final newAccessToken = data['data']['accessToken'] as String;
              final newRefreshToken = data['data']['refreshToken'] as String?;
              
              await _tokenStorage.saveAccessToken(newAccessToken);
              if (newRefreshToken != null) {
                await _tokenStorage.saveRefreshToken(newRefreshToken);
              }

              // Retry original request with new token
              final opts = err.requestOptions;
              opts.headers['Authorization'] = 'Bearer $newAccessToken';
              
              final response = await dio.fetch(opts);
              return handler.resolve(response);
            }
          }
        } catch (e) {
          // Refresh failed, clear tokens
          await _tokenStorage.clearAll();
        }
      }
    }

    handler.next(err);
  }
}


