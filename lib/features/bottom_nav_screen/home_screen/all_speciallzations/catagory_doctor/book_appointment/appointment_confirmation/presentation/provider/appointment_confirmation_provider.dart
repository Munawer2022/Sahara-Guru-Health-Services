import 'package:flutter/cupertino.dart';

import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/all_speciallzations/catagory_doctor/book_appointment/appointment_confirmation/data/repositories/appointment_confirmation_repository.dart';

import '../../data/models/appointment_confirmation_model.dart';

class AppointmentConfirmationProvider with ChangeNotifier {
  AppointmentConfirmationRepository appointmentConfirmationRepository =
      AppointmentConfirmationRepository();

  // ApiResponse<OldMyAppointmentModel> appointmnetsResponse =
  //     ApiResponse.loading();

  // setAppointments(ApiResponse<OldMyAppointmentModel> response) {
  //   appointmnetsResponse = response;
  // }

  Future<AppointmentConfirmationModel> baseAppointmentConfirmation(
      dynamic id) async {
    // setAppointments(ApiResponse.loading());
    return await appointmentConfirmationRepository
        .baseAppointmentConfirmation(id);
    // then((value) {
    //   setAppointments(ApiResponse.completed(value))
    //       .onError((error, stackTrace) {
    //     setAppointments(ApiResponse.error(error.toString()));
    //   });
    // });
  }
}
