import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/config/themes.dart';
import 'package:sahara_guru_health_services/features/presentation/provider/landingpage_controller.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_names.dart';
import 'features/presentation/provider/appointments_controller.dart';
import 'features/presentation/provider/bookappointment_controller.dart';
import 'features/presentation/provider/passwordhide_controller.dart';
import 'features/presentation/provider/theme_controller.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordHideController()),
        ChangeNotifierProvider(create: (_) => LandingPageController()),
        ChangeNotifierProvider(create: (_) => BookAppointmentController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => AppointmentController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: Themes.dark,
        theme: Themes.light,
        initialRoute: RoutesName.loginscreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
