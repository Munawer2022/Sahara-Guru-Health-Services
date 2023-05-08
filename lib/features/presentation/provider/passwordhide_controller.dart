import 'package:flutter/material.dart';

class PasswordHideController extends ChangeNotifier {
  bool _isVisible = false;
  bool get isVisible => _isVisible;
  hideicon() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
