import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../../../../../core/error/app_excaptions.dart';
import '../../../../../../core/error/return_response.dart';
import '../../../../../../core/utils/constants/app_url.dart';
import '../models/all_speciallzations_model.dart';
import 'all_speciallzations_base_api_services.dart';

class AllSpeciallzationsRespository
    implements AllSpeciallzationsBaseApiServices {
  final box = GetStorage();

  @override
  Future<AllSpeciallzationsModel> baseAllSpeciallzations() async {
    @override
    dynamic responseJson;
    try {
      Response response = await get(
        Uri.parse(AppUrl.listDoctors),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      return responseJson = AllSpeciallzationsModel.fromJson(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }
}
