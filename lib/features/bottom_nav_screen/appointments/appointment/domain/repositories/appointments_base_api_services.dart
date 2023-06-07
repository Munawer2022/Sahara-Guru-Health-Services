import '../../data/models/upcoming_appointment_model.dart';

import '../../data/models/old_appointment_model.dart';

abstract class AppointmentsBaseApiServices {
  Future<OldMyAppointmentModel> baseOldAppointments();
  Future<UpcomingMyAppointmentModel> baseUpcomingAppointments();
}
