import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/infrastructure.dart';

class DependencyInjector {
  static final DependencyInjector _singleton = DependencyInjector._internal();

  factory DependencyInjector() {
    return _singleton;
  }

  DependencyInjector._internal();

  final GetIt getIt = GetIt.instance;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /////////////////////////////////////////

  ///Setup
  Future<void> setup() async {
    ///Auth
    final authRepositoryImpl =
        AuthRepositoryImpl(AuthService(flutterSecureStorage: _storage));

    ///Store
    final storeRepositoryImpl =
        StoreRepositoryImpl(StoreService(flutterSecureStorage: _storage));

    ///////////////////////////////////////////////////////////////////////////

    ///Auth
    getIt.registerSingleton<AuthUseCase>(AuthUseCase(authRepositoryImpl));

    ///Store
    getIt.registerSingleton<StoreUseCase>(StoreUseCase(storeRepositoryImpl));
  }
}
