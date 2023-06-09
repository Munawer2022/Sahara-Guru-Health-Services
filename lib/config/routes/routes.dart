import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_screen.dart';

import '../../features/bottom_nav_screen/bottom_nav_dashboard.dart';
import '../../features/bottom_nav_screen/home_screen/search_doctor/presentation/pages/search_doctor_screen.dart';
import '../../features/bottom_nav_screen/home_screen/home_screen.dart';
import '../../features/bottom_nav_screen/home_screen/book_appointment/presentation/pages/book_appointment.dart';
import '../../features/bottom_nav_screen/home_screen/catagory_doctor/presentation/pages/catagory_doctor.dart';
import '../../features/bottom_nav_screen/profile/profile.dart';

import '../../features/bottom_nav_screen/home_screen/all_speciallzations/presentation/pages/all_speciallzations_screen.dart';
import '../../features/bottom_nav_screen/appointments/appointment_confirmation/presentation/pages/appointment_confirmation_screen.dart';

import '../../core/utils/splesh_screen.dart';
import 'routes_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.searchdoctor:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SearchDoctorScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case RoutesName.catagoryDoctor:
        return MaterialPageRoute(
            builder: (BuildContext context) => CatagoryDoctorScreen(
                  data: settings.arguments as Map,
                ));
      case RoutesName.loginscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

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
            builder: (BuildContext context) => const BottomNavDashboard());

      case RoutesName.appointmentConfirmation:
        return MaterialPageRoute(
            builder: (BuildContext context) => AppointmentConfirmationScreen(
                  para: settings.arguments as Map,
                ));
      case RoutesName.profileScreen:
        return MaterialPageRoute(builder: (BuildContext context) => Profile());
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.allSpeciallzations:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const AllSpeciallzationsScreen());

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
