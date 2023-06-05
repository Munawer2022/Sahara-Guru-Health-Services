import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/network/NetworkApiService.dart';
import 'package:sahara_guru_health_services/core/utils/constants/app_url.dart';

import 'login_base_api_services.dart';

// class LoginRespository {
//   final _apiService = NetworkApiService();

//   Future<dynamic> loginApi(dynamic data) async {
//     try {
//       dynamic response =
//           await _apiService.loginPostApiResponse(AppUrl.login, data);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

class LoginRepository implements LoginBaseApiServices {
  @override
  Future<dynamic> loginPostApiResponse(dynamic data) async {
    dynamic responseJson;

    Response response = await post(
      Uri.parse(AppUrl.login),
      body: data,
      headers: {
        'Accept': 'application/json',
      },
    );
    responseJson = returnResponse(response);
    return responseJson;
  }
}
