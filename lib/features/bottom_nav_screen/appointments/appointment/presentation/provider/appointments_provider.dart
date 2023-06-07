import 'package:flutter/cupertino.dart';

import '../../data/models/old_appointment_model.dart';
import '../../data/models/upcoming_appointment_model.dart';

import '../../data/repositories/appointments_repository.dart';

class AppointmentsProvider with ChangeNotifier {
  AppointmentsRepository appointmentsRepository = AppointmentsRepository();

  Future<OldMyAppointmentModel> baseOldAppointments() async {
    return await appointmentsRepository.baseOldAppointments();
  }

  Future<UpcomingMyAppointmentModel> baseUpcomingAppointments() async {
    return await appointmentsRepository.baseUpcomingAppointments();
  }
}
