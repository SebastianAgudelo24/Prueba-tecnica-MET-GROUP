import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

abstract class MyTheme {
  static const FlexScheme _scheme = FlexScheme.blueM3;
  static ThemeData get _baseLight => FlexThemeData.light(
      scheme: _scheme, fontFamily: 'inter', useMaterial3: true);

  // Theme data light
  static ThemeData get light => _baseLight.copyWith(
        appBarTheme: _appBarTheme,
        inputDecorationTheme: _inputTheme(theme: _baseLight),
        textTheme: const TextTheme(
            headlineLarge: headlineLarge,
            headlineMedium: headlineMedium,
            headlineSmall: headlineSmall,
            titleLarge: titleLarge,
            titleMedium: titleMedium,
            titleSmall: titleSmall,
            bodyLarge: bodyLarge,
            bodyMedium: bodyRegular,
            bodySmall: bodySmall),
      );

  // App bar theme
  static AppBarTheme get _appBarTheme =>
      const AppBarTheme(elevation: 0, centerTitle: false);

  static InputDecorationTheme _inputTheme({required ThemeData theme}) =>
      InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.defaultInput),
        ),
        focusColor: AppColors.black,
        focusedBorder: _border(side: const BorderSide(color: AppColors.black)),
        activeIndicatorBorder: const BorderSide(color: AppColors.black),
        filled: true,
        fillColor: theme.hoverColor,
        border: _border(),
        errorBorder: _border(
          side: BorderSide(color: theme.colorScheme.error, width: 1.5),
        ),
        labelStyle: const TextStyle(color: AppColors.black), // Cambio aquí
      );

  // Border
  static InputBorder _border({BorderSide? side}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      );

  // Define diferentes estilos de texto para diferentes tamaños de letra
  static const TextStyle headlineLarge = TextStyle(
      fontSize: 55,
      fontWeight: FontWeight.bold,
      fontFamily: 'urban',
      color: Colors.black);

  static const TextStyle headlineMedium = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      fontFamily: 'urban',
      color: Colors.black);

  static const TextStyle headlineSmall = TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      fontFamily: 'urban',
      color: Colors.black);

  static const TextStyle titleLarge = TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      fontFamily: 'plusJakartaSans',
      color: Colors.black);

  static const TextStyle titleMedium = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'plusJakartaSans',
      color: Colors.black);

  static const TextStyle titleSmall = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'plusJakartaSans',
      color: Colors.black);

  static const TextStyle bodyLarge =
      TextStyle(fontSize: 20, fontFamily: 'inter', color: Colors.black);

  static const TextStyle bodyRegular =
      TextStyle(fontSize: 16, fontFamily: 'inter', color: Colors.black);

  static const TextStyle bodySmall =
      TextStyle(fontSize: 14, fontFamily: 'inter', color: Colors.black);
}
