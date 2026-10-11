import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final light = ThemeData(
    colorSchemeSeed: Colors.deepPurple,
    useMaterial3: true,
  );

  static final dark = ThemeData(
    colorSchemeSeed: Colors.deepPurple,
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
