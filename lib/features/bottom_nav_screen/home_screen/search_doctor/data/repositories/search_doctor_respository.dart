import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import '../../../../../../core/error/return_response.dart';
import '../../../../../../core/utils/constants/app_url.dart';

import 'search_doctor_base_api_services.dart';

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
