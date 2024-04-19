class AppApi {
  static final AppApi _singleton = AppApi._internal();

  factory AppApi() {
    return _singleton;
  }

  AppApi._internal();

  static const String baseUrl = 'https://test-api-met.herokuapp.com';
}
