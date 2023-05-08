import 'package:flutter/material.dart';
import '../core/utils/constants/fonts.dart';

class Themes {
  static final light = ThemeData(
    fontFamily: firstfont,
    scaffoldBackgroundColor: Colors.grey.shade200,
    colorSchemeSeed: Colors.blue,
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        // titleTextStyle: TextStyle(fontFamily: fonts.firstfont),
        ),
  );
  static final dark = ThemeData(
    colorSchemeSeed: Colors.lightBlueAccent,
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
