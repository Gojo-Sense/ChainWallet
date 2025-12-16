// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/achievements/data/repositories/achievement_repository_impl.dart'
    as _i445;
import '../../features/achievements/presentation/bloc/achievement_bloc.dart'
    as _i941;
import '../../features/alerts/data/repositories/alert_repository_impl.dart'
    as _i298;
import '../../features/alerts/domain/repositories/i_alert_repository.dart'
    as _i203;
import '../../features/alerts/domain/services/alert_checker_service.dart'
    as _i186;
import '../../features/alerts/presentation/bloc/alert_bloc.dart' as _i107;
import '../../features/auth/data/datasources/auth_api.dart' as _i367;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/i_auth_repository.dart'
    as _i589;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/chat/data/repositories/chat_repository_impl.dart'
    as _i504;
import '../../features/chat/domain/repositories/i_chat_repository.dart' as _i81;
import '../../features/chat/presentation/bloc/chat_bloc.dart' as _i65;
import '../../features/market/data/datasources/binance_websocket_api.dart'
    as _i224;
import '../../features/market/data/datasources/coingecko_api.dart' as _i640;
import '../../features/market/data/datasources/coingecko_free_api.dart'
    as _i1050;
import '../../features/market/data/datasources/mock_chart_api.dart' as _i257;
import '../../features/market/data/repositories/market_repository_impl.dart'
    as _i521;
import '../../features/market/domain/repositories/i_market_repository.dart'
    as _i490;
import '../../features/market/presentation/bloc/market_bloc.dart' as _i1064;
import '../../features/nft/data/repositories/nft_repository_impl.dart' as _i105;
import '../../features/nft/presentation/bloc/nft_bloc.dart' as _i857;
import '../../features/portfolio/data/repositories/portfolio_repository_impl.dart'
    as _i452;
import '../../features/portfolio/domain/repositories/i_portfolio_repository.dart'
    as _i737;
import '../../features/portfolio/presentation/bloc/portfolio_bloc.dart'
    as _i716;
import '../../features/swap/data/repositories/swap_repository_impl.dart'
    as _i625;
import '../../features/swap/domain/repositories/i_swap_repository.dart'
    as _i710;
import '../../features/swap/presentation/bloc/swap_bloc.dart' as _i151;
import '../../features/transactions/data/repositories/transaction_repository_impl.dart'
    as _i443;
import '../../features/transactions/domain/repositories/i_transaction_repository.dart'
    as _i745;
import '../../features/transactions/presentation/bloc/transaction_bloc.dart'
    as _i785;
import '../../features/wallet/data/datasources/wallet_local_datasource.dart'
    as _i114;
import '../../features/wallet/data/repositories/wallet_repository_impl.dart'
    as _i690;
import '../../features/wallet/domain/repositories/i_wallet_repository.dart'
    as _i955;
import '../../features/wallet/presentation/bloc/wallet_bloc.dart' as _i87;
import '../interceptors/auth_interceptor.dart' as _i48;
import '../services/biometric_service.dart' as _i374;
import '../services/lock_service.dart' as _i663;
import '../services/token_storage_service.dart' as _i474;
import '../services/web3_service.dart' as _i131;
import '../services/websocket_service.dart' as _i555;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final secureStorageModule = _$SecureStorageModule();
    gh.lazySingleton<_i374.BiometricService>(() => _i374.BiometricService());
    gh.lazySingleton<_i663.LockService>(() => _i663.LockService());
    gh.lazySingleton<_i474.TokenStorageService>(
      () => _i474.TokenStorageService(),
    );
    gh.lazySingleton<_i131.Web3Service>(() => _i131.Web3Service());
    gh.lazySingleton<_i555.WebSocketService>(() => _i555.WebSocketService());
    gh.lazySingleton<_i224.BinanceWebSocketApi>(
      () => _i224.BinanceWebSocketApi(),
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i257.MockChartApi>(() => _i257.MockChartApi());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => secureStorageModule.secureStorage,
    );
    gh.lazySingleton<_i445.IAchievementRepository>(
      () => _i445.AchievementRepositoryImpl(),
    );
    gh.lazySingleton<_i737.IPortfolioRepository>(
      () => _i452.PortfolioRepositoryImpl(),
    );
    gh.lazySingleton<_i640.CoinGeckoApi>(
      () => _i640.CoinGeckoApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1050.CoinGeckoFreeApi>(
      () => _i1050.CoinGeckoFreeApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i710.ISwapRepository>(() => _i625.SwapRepositoryImpl());
    gh.lazySingleton<_i745.ITransactionRepository>(
      () => _i443.TransactionRepositoryImpl(),
    );
    gh.lazySingleton<_i105.INFTRepository>(() => _i105.NFTRepositoryImpl());
    gh.factory<_i941.AchievementBloc>(
      () => _i941.AchievementBloc(gh<_i445.IAchievementRepository>()),
    );
    gh.lazySingleton<_i48.AuthInterceptor>(
      () => _i48.AuthInterceptor(gh<_i474.TokenStorageService>()),
    );
    gh.factory<_i716.PortfolioBloc>(
      () => _i716.PortfolioBloc(gh<_i737.IPortfolioRepository>()),
    );
    gh.lazySingleton<_i203.IAlertRepository>(
      () => _i298.AlertRepositoryImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i490.IMarketRepository>(
      () => _i521.MarketRepositoryImpl(
        gh<_i640.CoinGeckoApi>(),
        gh<_i224.BinanceWebSocketApi>(),
        gh<_i257.MockChartApi>(),
        gh<_i555.WebSocketService>(),
      ),
    );
    gh.lazySingleton<_i114.WalletLocalDatasource>(
      () => _i114.WalletLocalDatasource(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i1064.MarketBloc>(
      () => _i1064.MarketBloc(gh<_i490.IMarketRepository>()),
    );
    gh.factory<_i785.TransactionBloc>(
      () => _i785.TransactionBloc(gh<_i745.ITransactionRepository>()),
    );
    gh.factory<_i857.NFTBloc>(() => _i857.NFTBloc(gh<_i105.INFTRepository>()));
    gh.lazySingleton<_i955.IWalletRepository>(
      () => _i690.WalletRepositoryImpl(
        gh<_i114.WalletLocalDatasource>(),
        gh<_i131.Web3Service>(),
      ),
    );
    gh.lazySingleton<_i367.AuthApi>(
      () => _i367.AuthApi(gh<_i48.AuthInterceptor>()),
    );
    gh.factory<_i107.AlertBloc>(
      () => _i107.AlertBloc(
        gh<_i203.IAlertRepository>(),
        gh<_i555.WebSocketService>(),
      ),
    );
    gh.factory<_i151.SwapBloc>(
      () => _i151.SwapBloc(
        gh<_i710.ISwapRepository>(),
        gh<_i745.ITransactionRepository>(),
      ),
    );
    gh.lazySingleton<_i186.AlertCheckerService>(
      () => _i186.AlertCheckerService(
        gh<_i203.IAlertRepository>(),
        gh<_i490.IMarketRepository>(),
        gh<_i555.WebSocketService>(),
      ),
    );
    gh.lazySingleton<_i589.IAuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i367.AuthApi>(),
        gh<_i474.TokenStorageService>(),
      ),
    );
    gh.factory<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        gh<_i589.IAuthRepository>(),
        gh<_i555.WebSocketService>(),
      ),
    );
    gh.factory<_i87.WalletBloc>(
      () => _i87.WalletBloc(gh<_i955.IWalletRepository>()),
    );
    gh.lazySingleton<_i81.IChatRepository>(
      () => _i504.ChatRepositoryImpl(gh<_i490.IMarketRepository>()),
    );
    gh.factory<_i65.ChatBloc>(() => _i65.ChatBloc(gh<_i81.IChatRepository>()));
    return this;
  }
}

class _$DioModule extends _i640.DioModule {}

class _$SecureStorageModule extends _i114.SecureStorageModule {}
