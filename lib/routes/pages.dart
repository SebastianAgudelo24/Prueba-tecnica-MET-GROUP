import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/auth/onBoarding.dart';

import 'routes.dart';

abstract class AppPages {
  AppPages._();

  ///Pages
  static Map<String, Widget Function(BuildContext)> routes = {
    ///Auth
    AppRoutes.initial: (context) => const OnBoardingScreen(),
    AppRoutes.login: (context) => Container(),
    AppRoutes.register: (context) => Container(),

    ///Home
    AppRoutes.home: (context) => Container(),
  };
}
