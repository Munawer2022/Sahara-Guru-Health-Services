import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.check(context);

    // Timer(const Duration(seconds: 2),
    //     () => Navigator.pushNamed(context, RoutesName.loginscreen));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Sahara Guru',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class SplashServices {
  final box = GetStorage();
  void check(BuildContext context) {
    if (box.read('token') != null) {
      Timer(const Duration(seconds: 2),
          () => Navigator.pushNamed(context, RoutesName.bottomnavdashboard));
    } else {
      Timer(const Duration(seconds: 2),
          () => Navigator.pushNamed(context, RoutesName.loginscreen));
    }
  }
}
