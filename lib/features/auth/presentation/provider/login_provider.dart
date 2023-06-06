import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahara_guru_health_services/core/utils/utils.dart';
import 'package:sahara_guru_health_services/features/auth/data/repositories/login_respository.dart';

import '../../../../config/routes/routes_names.dart';

class LoginProvider extends ChangeNotifier {
  final box = GetStorage();
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  bool _loading = false;
  bool get loading => _loading;

  dynamic _response;
  dynamic get response => _response;

  hideicon() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  loadingBotton(bool value) {
    _loading = value;
    notifyListeners();
  }

  final LoginRepository loginRepository = LoginRepository();
  Future<dynamic> loginPostApiResponse(
      BuildContext context, dynamic data) async {
    loadingBotton(true);

    return await loginRepository.loginPostApiResponse(data).then((value) {
      loadingBotton(false);
      Navigator.pushNamed(
        context,
        RoutesName.bottomnavdashboard,
      );
      debugPrint(value['token']);
      box.write('token', value['token']);
      // box.write('id', value['user']['id']);
      _response = value;
    }).onError((error, stackTrace) {
      loadingBotton(false);

      Utils().errorSnackBarMessage(error.toString(), context);
      notifyListeners();
    });
  }
}
      // box.write('first_name', value['user']['first_name']);
      // box.write('last_name', value['user']['last_name']);
      // box.write('profile', value['user']['profile']);
      // box.write('email', value['user']['email']);
      // box.write('phone_number', value['user']['phone_number']);