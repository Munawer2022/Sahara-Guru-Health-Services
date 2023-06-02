import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/config/themes.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/search_doctor/presentation/provider/search_doctor_provider.dart';
import 'package:sahara_guru_health_services/features/provider/bottom_nav_dashboard_controller.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_names.dart';

import 'features/bottom_nav_screen/appointments/data/repositories/appointments_base_api_services.dart';
import 'features/bottom_nav_screen/appointments/data/repositories/appointments_repository.dart';
import 'features/bottom_nav_screen/appointments/presentation/provider/appointments_provider.dart';

import 'features/bottom_nav_screen/home_screen/all_speciallzations/presentation/provider/all_speciallzations_provider.dart';
import 'features/provider/appointments_controller.dart';
import 'features/provider/bookappointment_controller.dart';
import 'features/auth/presentation/provider/login_provider.dart';

import 'package:get_storage/get_storage.dart';
import 'package:get_it/get_it.dart';

import 'features/widgets/slide_horizontal_list.dart';

GetIt getIt = GetIt.instance;

void main() async {
  await GetStorage.init();
  // getIt.registerLazySingleton<AppointmentsBaseApiServices>(() => AppointmentsRepository());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AllSpeciallzationsProvider()),
    ChangeNotifierProvider(create: (_) => AppointmentsProvider()),
    ChangeNotifierProvider(create: (_) => AllSpeciallzationsProvider()),

    // ChangeNotifierProvider(create: (_) => SearchDoctorProvider()),
    // ChangeNotifierProvider(create: (_) =>AppointmentsProvider(appointmentsBaseApiServices: getIt())..baseOldAppointments()),

    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => BottomNavDashboardController()),
    ChangeNotifierProvider(create: (_) => BookAppointmentController()),
    ChangeNotifierProvider(create: (_) => AppointmentController()),
    // ChangeNotifierProvider(create: (_) => SearchDoctorController()),
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
// GetIt getIt = GetIt.instance;

// void main() async {
//   await GetStorage.init();
//   getIt.registerLazySingleton<BaseApiServices>(() => LoginRespository());
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(
//         create: (_) => LoginController(loginRespository: getIt())),
//     ChangeNotifierProvider(create: (_) => LandingPageController()),
//     ChangeNotifierProvider(create: (_) => BookAppointmentController()),
//     ChangeNotifierProvider(create: (_) => ThemeController()),
//     ChangeNotifierProvider(create: (_) => AppointmentController()),
//   ], child: const MyApp()));
// }