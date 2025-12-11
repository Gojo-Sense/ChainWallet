# Backend Integration Guide

## Flutter App Integration

### 1. Add HTTP Client Dependency

Add to `pubspec.yaml`:
```yaml
dependencies:
  dio: ^5.4.0
  web_socket_channel: ^2.4.0
```

### 2. Create API Service

Create `lib/core/services/api_service.dart`:
```dart
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String baseUrl = 'http://localhost:3000/api';

  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.read(key: 'access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          // Handle token refresh
          await _refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
        }
        return handler.next(error);
      },
    ));
  }

  Future<void> _refreshToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken != null) {
      final response = await _dio.post('/auth/refresh', data: {'refreshToken': refreshToken});
      await _storage.write(key: 'access_token', value: response.data['data']['accessToken']);
      await _storage.write(key: 'refresh_token', value: response.data['data']['refreshToken']);
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final token = await _storage.read(key: 'access_token');
    requestOptions.headers['Authorization'] = 'Bearer $token';
    return _dio.request(
      requestOptions.path,
      options: Options(method: requestOptions.method),
      data: requestOptions.data,
    );
  }

  // Auth methods
  Future<Map<String, dynamic>> register(String email, String password) async {
    final response = await _dio.post('/auth/register', data: {
      'email': email,
      'password': password,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post('/auth/login', data: {
      'email': email,
      'password': password,
    });
    await _storage.write(key: 'access_token', value: response.data['data']['accessToken']);
    await _storage.write(key: 'refresh_token', value: response.data['data']['refreshToken']);
    return response.data;
  }

  // Wallet methods
  Future<List<dynamic>> getWallets() async {
    final response = await _dio.get('/wallets');
    return response.data['data'];
  }

  Future<Map<String, dynamic>> addWallet(String address, String network, {String? nickname}) async {
    final response = await _dio.post('/wallets', data: {
      'address': address,
      'network': network,
      'nickname': nickname,
    });
    return response.data;
  }

  // Transaction methods
  Future<Map<String, dynamic>> getTransactions({int? limit, int? offset}) async {
    final response = await _dio.get('/transactions', queryParameters: {
      'limit': limit,
      'offset': offset,
    });
    return response.data['data'];
  }

  // Portfolio methods
  Future<Map<String, dynamic>> getPortfolio() async {
    final response = await _dio.get('/portfolio');
    return response.data['data'];
  }

  // Alert methods
  Future<List<dynamic>> getAlerts() async {
    final response = await _dio.get('/alerts');
    return response.data['data'];
  }

  Future<Map<String, dynamic>> createAlert(String tokenSymbol, double targetPrice, String condition) async {
    final response = await _dio.post('/alerts', data: {
      'tokenSymbol': tokenSymbol,
      'targetPrice': targetPrice,
      'condition': condition,
    });
    return response.data;
  }
}
```

### 3. WebSocket Integration

Create `lib/core/services/websocket_service.dart`:
```dart
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String wsUrl = 'ws://localhost:3000';

  Future<void> connect() async {
    final token = await _storage.read(key: 'access_token');
    if (token == null) return;

    _channel = WebSocketChannel.connect(
      Uri.parse('$wsUrl?token=$token'),
    );
  }

  Stream<dynamic> get priceUpdates => _channel?.stream ?? const Stream.empty();

  void subscribeToPrices(List<String> tokens) {
    _channel?.sink.add(JSON.encode({
      'event': 'subscribe_prices',
      'data': tokens,
    }));
  }

  void disconnect() {
    _channel?.sink.close();
    _channel = null;
  }
}
```

## Angular Dashboard Integration

### 1. Create API Service

Create `web-admin/src/app/services/api.service.ts`:
```typescript
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, BehaviorSubject } from 'rxjs';
import { tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl = 'http://localhost:3000/api';
  private accessToken$ = new BehaviorSubject<string | null>(null);

  constructor(private http: HttpClient) {
    const token = localStorage.getItem('access_token');
    if (token) {
      this.accessToken$.next(token);
    }
  }

  private getHeaders(): HttpHeaders {
    const token = this.accessToken$.value;
    return new HttpHeaders({
      'Content-Type': 'application/json',
      ...(token ? { 'Authorization': `Bearer ${token}` } : {}),
    });
  }

  // Auth methods
  register(email: string, password: string): Observable<any> {
    return this.http.post(`${this.baseUrl}/auth/register`, { email, password });
  }

  login(email: string, password: string): Observable<any> {
    return this.http.post(`${this.baseUrl}/auth/login`, { email, password }).pipe(
      tap((response: any) => {
        if (response.success && response.data) {
          localStorage.setItem('access_token', response.data.accessToken);
          localStorage.setItem('refresh_token', response.data.refreshToken);
          this.accessToken$.next(response.data.accessToken);
        }
      })
    );
  }

  // Wallet methods
  getWallets(): Observable<any> {
    return this.http.get(`${this.baseUrl}/wallets`, { headers: this.getHeaders() });
  }

  addWallet(address: string, network: string, nickname?: string): Observable<any> {
    return this.http.post(
      `${this.baseUrl}/wallets`,
      { address, network, nickname },
      { headers: this.getHeaders() }
    );
  }

  // Portfolio methods
  getPortfolio(): Observable<any> {
    return this.http.get(`${this.baseUrl}/portfolio`, { headers: this.getHeaders() });
  }

  // Alert methods
  getAlerts(): Observable<any> {
    return this.http.get(`${this.baseUrl}/alerts`, { headers: this.getHeaders() });
  }

  createAlert(tokenSymbol: string, targetPrice: number, condition: 'above' | 'below'): Observable<any> {
    return this.http.post(
      `${this.baseUrl}/alerts`,
      { tokenSymbol, targetPrice, condition },
      { headers: this.getHeaders() }
    );
  }
}
```

### 2. WebSocket Integration

Create `web-admin/src/app/services/websocket.service.ts`:
```typescript
import { Injectable } from '@angular/core';
import { io, Socket } from 'socket.io-client';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class WebSocketService {
  private socket: Socket | null = null;

  connect(token: string): void {
    this.socket = io('http://localhost:3000', {
      auth: { token },
    });
  }

  onPriceUpdate(): Observable<any> {
    return new Observable(observer => {
      if (this.socket) {
        this.socket.on('price_update', (data) => {
          observer.next(data);
        });
      }
    });
  }

  subscribeToPrices(tokens: string[]): void {
    if (this.socket) {
      this.socket.emit('subscribe_prices', tokens);
    }
  }

  disconnect(): void {
    if (this.socket) {
      this.socket.disconnect();
      this.socket = null;
    }
  }
}
```

## Environment Setup

### Backend Environment Variables

Create `backend/.env`:
```env
PORT=3000
NODE_ENV=development
DATABASE_URL=postgresql://postgres:password@localhost:5432/aether_wallet
REDIS_URL=redis://localhost:6379
JWT_SECRET=your-secret-key
JWT_REFRESH_SECRET=your-refresh-secret
COINGECKO_API_KEY=your-api-key
```

### Database Setup

1. Install PostgreSQL
2. Create database:
```bash
createdb aether_wallet
```

3. Run migrations:
```bash
cd backend
npm run migrate
```

### Redis Setup

1. Install Redis
2. Start Redis:
```bash
redis-server
```

## Testing the API

### Register User
```bash
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"Test1234!"}'
```

### Login
```bash
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"Test1234!"}'
```

### Get Wallets (requires auth token)
```bash
curl -X GET http://localhost:3000/api/wallets \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN"
```


