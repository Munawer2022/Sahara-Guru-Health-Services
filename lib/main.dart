import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/config/themes.dart';

import 'package:sahara_guru_health_services/features/bottom_nav_screen/bottom_nav_dashboard_controller.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_names.dart';

import 'features/bottom_nav_screen/appointments/presentation/provider/appointments_provider.dart';

import 'features/bottom_nav_screen/home_screen/all_speciallzations/all_speciallzations/presentation/provider/all_speciallzations_provider.dart';
import 'features/bottom_nav_screen/home_screen/all_speciallzations/catagory_doctor/book_appointment/appointment_confirmation/presentation/provider/appointment_confirmation_provider.dart';

import 'features/bottom_nav_screen/home_screen/all_speciallzations/catagory_doctor/book_appointment/bookappointment_controller.dart';
import 'features/auth/presentation/provider/login_provider.dart';

import 'package:get_storage/get_storage.dart';

// GetIt getIt = GetIt.instance;

void main() async {
  await GetStorage.init();
  // getIt.registerLazySingleton<AppointmentsBaseApiServices>(() => AppointmentsRepository());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => BottomNavDashboardController()),
    ChangeNotifierProvider(create: (_) => AllSpeciallzationsProvider()),
    ChangeNotifierProvider(create: (_) => BookAppointmentController()),
    ChangeNotifierProvider(create: (_) => AppointmentsProvider()),
    ChangeNotifierProvider(create: (_) => AllSpeciallzationsProvider()),
    ChangeNotifierProvider(create: (_) => AppointmentConfirmationProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: Themes.dark,
      theme: Themes.light,
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
