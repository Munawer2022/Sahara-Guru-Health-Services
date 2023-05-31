import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/config/themes.dart';
import 'package:sahara_guru_health_services/features/provider/bottom_nav_dashboard_controller.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_names.dart';

import 'features/bottom_nav_screen/home_screen/search_doctor.dart';
import 'features/provider/appointments_controller.dart';
import 'features/provider/bookappointment_controller.dart';
import 'features/auth/presentation/provider/login_provider.dart';

import 'package:get_storage/get_storage.dart';
import 'package:get_it/get_it.dart';

import 'features/provider/search_doctor_controller.dart';

GetIt getIt = GetIt.instance;

void main() async {
  await GetStorage.init();
  // getIt.registerLazySingleton<BaseApiServices>(() => LoginRespository());
  runApp(MultiProvider(providers: [
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