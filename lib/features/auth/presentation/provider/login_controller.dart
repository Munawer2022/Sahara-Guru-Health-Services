import 'dart:js';

import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/features/auth/data/repositories/login_respository.dart';

class LoginController extends ChangeNotifier {
  bool _isVisible = false;
  bool get isVisible => _isVisible;
  hideicon() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final LoginRespository loginRespository;

  LoginController({required this.loginRespository});

  Future<void> login(BuildContext context) async {
    Map data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    loginRespository.loginApi(data, context);
    notifyListeners();
  }
}
