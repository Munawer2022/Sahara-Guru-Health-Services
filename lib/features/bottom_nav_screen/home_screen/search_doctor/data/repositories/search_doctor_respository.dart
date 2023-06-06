import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/error/return_response.dart';
import 'package:sahara_guru_health_services/core/utils/constants/app_url.dart';

import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/search_doctor/data/repositories/search_doctor_base_api_services.dart';

class SearchDoctorRepository implements SearchDoctorBaseApiServices {
  final box = GetStorage();

  @override
  dynamic baseSearchDoctor(String searchController) async {
    dynamic responseJson;

    Response response = await get(
      Uri.parse(AppUrl.searchDoctors + searchController),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      },
    );
    responseJson = returnResponse(response);
    return responseJson;
  }
}
