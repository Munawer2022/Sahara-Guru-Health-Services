import 'package:flutter/cupertino.dart';

import '../../data/repositories/appointment_confirmation_repository.dart';

import '../../data/models/appointment_confirmation_model.dart';

class AppointmentConfirmationProvider with ChangeNotifier {
  AppointmentConfirmationRepository appointmentConfirmationRepository =
      AppointmentConfirmationRepository();

  Future<AppointmentConfirmationModel> baseAppointmentConfirmation(
      dynamic id) async {
    return await appointmentConfirmationRepository
        .baseAppointmentConfirmation(id);
  }
}
