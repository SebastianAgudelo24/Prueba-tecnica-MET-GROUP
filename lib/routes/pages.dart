import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/auth/login/login_screen.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/auth/onBoarding/on_boarding.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/auth/register/register_screen.dart';
import 'package:prueba_programador_sebastian_agudelo/screens/home/home_screen.dart';

import 'routes.dart';

abstract class AppPages {
  AppPages._();

  ///Pages
  static Map<String, Widget Function(BuildContext)> routes = {
    ///Auth
    AppRoutes.initial: (context) => const OnBoardingScreen(),
    AppRoutes.login: (context) => const LoginScreen(),
    AppRoutes.register: (context) => const RegisterScreen(),

    ///Home
    AppRoutes.home: (context) => const HomeScreen(),
  };
}
