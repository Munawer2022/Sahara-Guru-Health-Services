import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/bottom_nav_dashboard_controller.dart';
import 'appointments/my_appointment.dart';
import 'home_screen/home_screen.dart';

class BottomNavDashboard extends StatelessWidget {
  const BottomNavDashboard({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    const MyAppointment(),
    const MyAppointment(),
    const MyAppointment(),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint('BottomNavDashboard');

    return Consumer<BottomNavDashboardController>(
      builder: (context, value, child) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            selectedIndex: value.tabIndex,
            onDestinationSelected: (index) {
              value.changeTabIndex(index);
            },
            destinations: const <NavigationDestination>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.calendar_month),
                icon: Icon(Icons.calendar_month_outlined),
                label: 'Appointments',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.receipt),
                icon: Icon(Icons.receipt_outlined),
                label: 'Records',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.login),
                icon: Icon(Icons.login_outlined),
                label: 'Login',
              ),
            ],
          ),
          body: _pages.elementAt(
            value.tabIndex,
          ),
        );
      },
    );
  }
}
