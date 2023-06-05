import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/data/models/upcoming_appointment_model.dart';

import '../models/old_appointment_model.dart';

abstract class AppointmentsBaseApiServices {
  Future<OldMyAppointmentModel> baseOldAppointments();
  Future<UpcomingMyAppointmentModel> baseUpcomingAppointments();
}
