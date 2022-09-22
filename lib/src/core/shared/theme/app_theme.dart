import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  const AppTheme._();

  static const primaryColor = Color(0xFF4EC3C8);

  static final lightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
  );

  static final theme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 90,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    ),
    scaffoldBackgroundColor: lightColorScheme.secondaryContainer,
    splashFactory: InkSparkle.splashFactory,
  );
}
