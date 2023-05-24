import 'package:sahara_guru_health_services/core/network/NetworkApiService.dart';
import 'package:sahara_guru_health_services/core/utils/constants/app_url.dart';

class LoginRespository {
  final _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.loginPostApiResponse(AppUrl.login, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
