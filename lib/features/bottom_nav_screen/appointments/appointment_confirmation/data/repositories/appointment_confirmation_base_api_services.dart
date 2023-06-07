import '../models/appointment_confirmation_model.dart';

abstract class AppointmentConfirmationBaseApiServices {
  Future<AppointmentConfirmationModel> baseAppointmentConfirmation(dynamic id);
}
