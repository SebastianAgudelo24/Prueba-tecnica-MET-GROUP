import 'package:get_it/get_it.dart';
import 'package:infrastructure/infrastructure.dart';

import '../resource/api.dart';

class DependencyInjector {
  static final DependencyInjector _singleton = DependencyInjector._internal();

  factory DependencyInjector() {
    return _singleton;
  }

  DependencyInjector._internal();

  final GetIt getIt = GetIt.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /////////////////// INSTANCIAS GLOBALES
  final Dio _dio = Dio(BaseOptions(baseUrl: AppApi.baseUrl));
  /////////////////////////////////////////

  ///Contact us
  Future<void> setup() async {}
}
