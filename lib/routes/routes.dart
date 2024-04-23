import 'package:flutter/material.dart';

import '../screens/auth/auth_screen.dart';
import '../screens/auth/login/login_screen.dart';
import '../screens/auth/onBoarding/on_boarding.dart';
import '../screens/home/home_screen.dart';

///This is the class that contains the name of the routes
abstract class AppRoutes {
  ///Initial Route
  static const auth = '/';
  static const onBoarding = '/onBoarding';
  static const login = '/login';
  static const home = '/home';

  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
    switch (settings.name) {
      case AppRoutes.auth:
        return MaterialPageRoute(builder: (context) => const AuthScreen());
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const AuthScreen());
    }
  };
}
