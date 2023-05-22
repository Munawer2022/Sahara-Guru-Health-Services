import 'package:flutter/cupertino.dart';
import 'package:sahara_guru_health_services/core/network/NetworkApiService.dart';
import 'package:sahara_guru_health_services/core/utils/constants/app_url.dart';

class LoginRespository {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(var data, BuildContext context) async {
    dynamic response =
        await _apiService.getLoginPostApiResponse(context, AppUrl.login, data);
    return response;
  }
}
