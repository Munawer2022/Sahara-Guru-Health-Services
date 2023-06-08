import '../models/upcoming_appointment_model.dart';

import '../models/old_appointment_model.dart';

abstract class AppointmentsBaseApiServices {
  Future<OldMyAppointmentModel> baseOldAppointments();
  Future<UpcomingMyAppointmentModel> baseUpcomingAppointments();
}
