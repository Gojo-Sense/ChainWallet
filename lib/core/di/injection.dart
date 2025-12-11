// ============================================================================
// FILE: injection.dart
// PURPOSE: Dependency injection setup using get_it and injectable
// PATTERN: Register all repositories as interfaces, not concrete implementations
// ============================================================================

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

