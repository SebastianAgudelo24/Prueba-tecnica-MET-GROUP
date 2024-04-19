import 'package:flutter/widgets.dart';

import 'routes.dart';

abstract class AppPages {
  AppPages._();

  ///Pages
  static Map<String, Widget Function(BuildContext)> routes = {
    ///Auth
    AppRoutes.initial: (context) => Container(),
    AppRoutes.login: (context) => Container(),
    AppRoutes.register: (context) => Container(),

    ///Home
    AppRoutes.home: (context) => Container(),
  };
}
