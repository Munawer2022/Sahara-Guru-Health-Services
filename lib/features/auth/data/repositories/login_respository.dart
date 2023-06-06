import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/error/return_response.dart';
import 'package:sahara_guru_health_services/core/utils/constants/app_url.dart';

import 'login_base_api_services.dart';

class LoginRepository implements LoginBaseApiServices {
  @override
  Future<dynamic> loginPostApiResponse(dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(AppUrl.login),
        body: data,
        headers: {
          'Accept': 'application/json',
        },
      );
      responseJson = returnResponse(response);
      return responseJson;
    } catch (e) {
      rethrow;
    }
  }
}
