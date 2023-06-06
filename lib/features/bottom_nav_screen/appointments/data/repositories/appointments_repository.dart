import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/error/return_response.dart';
import 'package:sahara_guru_health_services/core/utils/constants/app_url.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/data/models/upcoming_appointment_model.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/domain/repositories/appointments_base_api_services.dart';

import '../models/old_appointment_model.dart';

class AppointmentsRepository implements AppointmentsBaseApiServices {
  final box = GetStorage();

  @override
  Future<OldMyAppointmentModel> baseOldAppointments() async {
    dynamic responseJson;

    Response response = await get(
      Uri.parse(AppUrl.patientAppointments),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      },
    );

    responseJson = returnResponse(response);
    return responseJson = OldMyAppointmentModel.fromJson(responseJson);
  }

  @override
  Future<UpcomingMyAppointmentModel> baseUpcomingAppointments() async {
    dynamic responseJson;

    Response response = await get(
      Uri.parse(AppUrl.patientAppointments),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      },
    );
    responseJson = returnResponse(response);
    return responseJson = UpcomingMyAppointmentModel.fromJson(responseJson);
  }
}
