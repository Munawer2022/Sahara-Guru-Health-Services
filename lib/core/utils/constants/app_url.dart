class AppUrl {
  //base url
  static const String baseUrl =
      'https://saharadigitalhealth.in/sahara_digital_health/public/api/';
  //gets apis
  static const String listDoctors = '${baseUrl}department/doctors/list';
  static const String searchDoctors =
      '${baseUrl}search/department/doctors?searchTerm=';
  static const String patientAppointments = '${baseUrl}patient/appointments';
  //posts apis
  static const String login = '${baseUrl}login';
  static const String logout = '${baseUrl}logout';
  static const String saveAppointment = '${baseUrl}save-appointment';
}
