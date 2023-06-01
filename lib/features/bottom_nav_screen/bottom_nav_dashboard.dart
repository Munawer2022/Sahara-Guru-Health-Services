import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/profile/profile.dart';

import '../provider/bottom_nav_dashboard_controller.dart';
import 'appointments/presentation/pages/appointments_screen.dart';
import 'home_screen/home_screen.dart';

class BottomNavDashboard extends StatelessWidget {
  const BottomNavDashboard({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    AppointmentScreen(),
    Profile(),
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
                selectedIcon: Icon(
                  CupertinoIcons.house_fill,
                ),
                icon: Icon(
                  CupertinoIcons.home,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  CupertinoIcons.calendar,
                ),
                icon: Icon(Icons.calendar_month_outlined),
                label: 'Appointments',
              ),
              // NavigationDestination(
              //   selectedIcon: Icon(CupertinoIcons.doc_person_fill),
              //   icon: Icon(CupertinoIcons.doc_person),
              //   label: 'Records',
              // ),
              NavigationDestination(
                selectedIcon: Icon(
                  CupertinoIcons.person_alt_circle_fill,
                ),
                icon: Icon(
                  CupertinoIcons.person_alt_circle,
                ),
                label: 'Profile',
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
