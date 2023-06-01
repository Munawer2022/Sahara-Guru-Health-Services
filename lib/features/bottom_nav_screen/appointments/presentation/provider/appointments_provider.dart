import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/data/models/old_appointment_model.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/data/repositories/appointments_base_api_services.dart';

import '../../../../../core/error/api_response.dart';

import '../../data/repositories/appointments_repository.dart';

class AppointmentsProvider with ChangeNotifier {
  final box = GetStorage();
  AppointmentsRepository appointmentsRepository = AppointmentsRepository();
  // AppointmentsBaseApiServices appointmentsBaseApiServices;
  // AppointmentsProvider({required this.appointmentsBaseApiServices});
  // ApiResponse<OldMyAppointmentModel> appointmnetsResponse =
  //     ApiResponse.loading();

  // setAppointments(ApiResponse<OldMyAppointmentModel> response) {
  //   appointmnetsResponse = response;
  // }

  Future<OldMyAppointmentModel> baseOldAppointments() async {
    // setAppointments(ApiResponse.loading());
    return await appointmentsRepository.baseOldAppointments();
    // then((value) {
    //   setAppointments(ApiResponse.completed(value))
    //       .onError((error, stackTrace) {
    //     setAppointments(ApiResponse.error(error.toString()));
    //   });
    // });
  }
}
