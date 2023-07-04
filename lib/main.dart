import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'config/themes.dart';

import 'features/bottom_nav_screen/bottom_nav_dashboard.dart';

import 'config/routes/routes.dart';
import 'config/routes/routes_names.dart';

import 'features/bottom_nav_screen/appointments/appointment/presentation/provider/appointments_provider.dart';

import 'features/bottom_nav_screen/home_screen/all_speciallzations/presentation/provider/all_speciallzations_provider.dart';
import 'features/bottom_nav_screen/appointments/appointment_confirmation/presentation/provider/appointment_confirmation_provider.dart';

import 'features/bottom_nav_screen/home_screen/book_appointment/presentation/provider/bookappointment_controller.dart';
import 'features/auth/presentation/provider/login_provider.dart';

import 'package:get_storage/get_storage.dart';

// GetIt getIt = GetIt.instance;

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.black87));

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // darkTheme: Themes.dark,
      theme: Themes.light,
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
