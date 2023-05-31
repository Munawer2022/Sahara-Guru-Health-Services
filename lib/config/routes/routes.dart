import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/features/auth/presentation/pages/login_screen.dart';

import 'package:sahara_guru_health_services/features/bottom_nav_screen/bottom_nav_dashboard.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/search_doctor.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/home_screen.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/skin_specialists/book_appointment/book_appointment.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/skin_specialists/catagory_doctor.dart';

import '../../features/bottom_nav_screen/home_screen/all_speciallzations.dart';
import '../../features/bottom_nav_screen/home_screen/skin_specialists/book_appointment/appointment_corfirmation/appointment_confirmation.dart';
import '../../features/bottom_nav_screen/home_screen/skin_specialists/book_appointment/appointment_corfirmation/appointment_detail/appointment_detail.dart';
import '../../core/utils/splesh_screen.dart';
import 'routes_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.searchdoctor:
        return MaterialPageRoute(
            builder: (BuildContext context) => SearchDoctor());
      // case RoutesName.signupscreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => SignUpScreen());
      case RoutesName.skinspecialists:
        return MaterialPageRoute(
            builder: (BuildContext context) => CatagoryDoctor(
                  data: settings.arguments as Map,
                ));
      case RoutesName.loginscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());

      case RoutesName.bookappointment:
        return MaterialPageRoute(
            builder: (BuildContext context) => BookAppointment(
                  routeData: settings.arguments as Map,
                ));
      case RoutesName.homescreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.bottomnavdashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => BottomNavDashboard());
      // case RoutesName.appointmentsdetails:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => AppointmentsDetails());
      case RoutesName.appointmentConfirmation:
        return MaterialPageRoute(
            builder: (BuildContext context) => AppointmentConfirmation(
                  para: settings.arguments as Map,
                ));
      // case RoutesName.appointmentDetail:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => AppointmentDetail());
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());
      case RoutesName.allSpeciallzations:
        return MaterialPageRoute(
            builder: (BuildContext context) => AllSpeciallzations());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
