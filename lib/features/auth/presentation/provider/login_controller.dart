import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahara_guru_health_services/core/utils/utils.dart';
import 'package:sahara_guru_health_services/features/auth/data/repositories/login_respository.dart';

import '../../../../config/routes/routes_names.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginController extends ChangeNotifier {
  final box = GetStorage();
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  bool _loading = false;
  bool get loading => _loading;

  hideicon() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  loadingBotton(bool value) {
    _loading = value;
    notifyListeners();
  }

  final LoginRespository loginRespository = LoginRespository();

  // LoginController({required this.loginRespository});

  Future<void> login(
      BuildContext context, dynamic emailController, passwordController) async {
    var scaffold = ScaffoldMessenger.of(context);
    loadingBotton(true);
    Map data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    loginRespository.loginApi(data).then((value) {
      loadingBotton(false);
      Navigator.pushNamed(context, RoutesName.bottomnavdashboard);
      box.write('token', value['token']);
      box.write('id', value['user']['id']);
      box.write('first_name', value['user']['first_name']);
      box.write('last_name', value['user']['last_name']);
      Utils().snackBarMessage('Login Successfully', context);
    }).onError(
      (error, stackTrace) {
        loadingBotton(false);

        Utils().errorSnackBarMessage(error.toString(), context);
      },
    );
    notifyListeners();
  }
}
