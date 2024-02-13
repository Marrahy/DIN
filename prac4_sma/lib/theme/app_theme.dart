import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData customTheme(Color primaryColor) {
    return ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        color: primaryColor,
      ),
    );
  }
}
