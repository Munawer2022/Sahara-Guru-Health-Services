import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../../../../../core/error/app_excaptions.dart';
import '../../../../../../core/error/return_response.dart';
import '../../../../../../core/utils/constants/app_url.dart';
import '../../domain/repositories/appointments_base_api_services.dart';
import '../models/old_appointment_model.dart';
import '../models/upcoming_appointment_model.dart';

class AppointmentsRepository implements AppointmentsBaseApiServices {
  final box = GetStorage();

  @override
  Future<OldMyAppointmentModel> baseOldAppointments() async {
    dynamic responseJson;
    try {
      Response response = await get(
        Uri.parse(AppUrl.patientAppointments),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
        },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson = OldMyAppointmentModel.fromJson(responseJson);
  }

  @override
  Future<UpcomingMyAppointmentModel> baseUpcomingAppointments() async {
    dynamic responseJson;
    try {
      Response response = await get(
        Uri.parse(AppUrl.patientAppointments),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
        },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson = UpcomingMyAppointmentModel.fromJson(responseJson);
  }
}
