import 'package:flutter/material.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      fontFamily: 'Clash Grotesk',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.black,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.black87,
      ),
      scaffoldBackgroundColor: Colors.black87,
      primaryColor: Colors.black87,
      splashColor: Colors.transparent,
      fontFamily: 'Clash Grotesk',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: Colors.white,
      ),
    );
  }
}
