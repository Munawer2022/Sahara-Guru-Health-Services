import 'package:http/http.dart';
import '../../../../core/error/return_response.dart';
import '../../../../core/utils/constants/app_url.dart';

import 'login_base_api_services.dart';

class LoginRepository implements LoginBaseApiServices {
  @override
  Future<dynamic> loginPostApiResponse(dynamic data) async {
    dynamic responseJson;
    // try {
    Response response = await post(
      Uri.parse(AppUrl.login),
      body: data,
      headers: {
        'Accept': 'application/json',
      },
    ).timeout(const Duration(seconds: 10));
    responseJson = returnResponse(response);
    return responseJson;
    // } catch (e) {
    //   return Exception(e.toString());
    // }
  }
}
