import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/error/return_response.dart';
import 'package:sahara_guru_health_services/core/utils/constants/app_url.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/all_speciallzations/catagory_doctor/book_appointment/appointment_confirmation/data/models/appointment_confirmation_model.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/all_speciallzations/catagory_doctor/book_appointment/appointment_confirmation/data/repositories/appointment_confirmation_base_api_services.dart';

import '../../../../../../../../../core/error/app_excaptions.dart';

class AppointmentConfirmationRepository
    implements AppointmentConfirmationBaseApiServices {
  final box = GetStorage();

  @override
  Future<AppointmentConfirmationModel> baseAppointmentConfirmation(
      dynamic id) async {
    dynamic responseJson;
    try {
      Response response = await get(
        Uri.parse(AppUrl.patientAppointmentswithId + id),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
        },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
      return responseJson = AppointmentConfirmationModel.fromJson(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      rethrow;
    }
  }
}
