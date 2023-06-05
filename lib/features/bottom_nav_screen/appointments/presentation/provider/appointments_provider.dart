import 'package:flutter/cupertino.dart';

import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/data/models/old_appointment_model.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/data/models/upcoming_appointment_model.dart';

import '../../../../../core/error/api_response.dart';
import '../../data/repositories/appointments_repository.dart';

class AppointmentsProvider with ChangeNotifier {
  AppointmentsRepository appointmentsRepository = AppointmentsRepository();

  // ApiResponse<OldMyAppointmentModel> oldappointmnetsResponse =
  //     ApiResponse.loading();

  // setAppointments(ApiResponse<OldMyAppointmentModel> response) {
  //   oldappointmnetsResponse = response;
  //   notifyListeners();
  // }

  Future<OldMyAppointmentModel> baseOldAppointments() async {
    // setAppointments(ApiResponse.loading());
    return await appointmentsRepository.baseOldAppointments();
    // then((value) {
    // setAppointments(ApiResponse.completed(value))
    //     .onError((error, stackTrace) {
    //   setAppointments(ApiResponse.error(error.toString()));
    // });

    // });
  }

  Future<UpcomingMyAppointmentModel> baseUpcomingAppointments() async {
    return await appointmentsRepository.baseUpcomingAppointments();
  }
}
