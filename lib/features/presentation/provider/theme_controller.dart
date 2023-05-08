import 'package:flutter/material.dart';

import '../../../config/themes.dart';

class ThemeController extends ChangeNotifier {
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    if (_isDarkMode) {
      Themes.light;
    } else {
      Themes.dark;
    }
    notifyListeners();
  }
}
