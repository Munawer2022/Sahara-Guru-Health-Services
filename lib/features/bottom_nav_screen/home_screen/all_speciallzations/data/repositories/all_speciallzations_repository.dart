import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../../../../../core/network/NetworkApiService.dart';
import '../../../../../../core/utils/constants/app_url.dart';
import '../../../search_doctor/data/repositories/search_doctor_base_api_services.dart';
import '../models/all_speciallzations_model.dart';
import 'all_speciallzations_base_api_services.dart';

class AllSpeciallzationsRespository
    implements AllSpeciallzationsBaseApiServices {
  final box = GetStorage();

  // Future<AllSpeciallzationsModel> allSpeciallzations() async {
  //   var url = Uri.parse(AppUrl.listDoctors);
  //   var response = await get(
  //     url,
  //     headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${box.read('token')}',
  //     },
  //   );
  //   var data = jsonDecode(response.body.toString());
  //   return AllSpeciallzationsModel.fromJson(data);
  // }

  @override
  Future<AllSpeciallzationsModel> baseAllSpeciallzations() async {
    @override
    dynamic responseJson;

    Response response = await get(
      Uri.parse(AppUrl.listDoctors),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      },
    );
    responseJson = returnResponse(response);
    return responseJson = AllSpeciallzationsModel.fromJson(responseJson);
  }
}
