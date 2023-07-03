import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/core/utils/constants/images.dart';
import 'profile/profile.dart';

import 'appointments/appointment/presentation/pages/appointments_screen.dart';
import 'home_screen/home_screen.dart';

class BottomNavDashboard extends StatelessWidget {
  const BottomNavDashboard({
    Key? key,
  }) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    const AppointmentScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint('BottomNavDashboard');

    return WillPopScope(
      onWillPop: () async {
        await SystemNavigator.pop();
        return true;
      },
      child: Consumer<BottomNavDashboardController>(
        builder: (context, value, child) {
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              elevation: 1,
              backgroundColor: Colors.white,
              selectedIndex: value.tabIndex,
              onDestinationSelected: (index) {
                value.changeTabIndex(index);
              },
              destinations: <NavigationDestination>[
                NavigationDestination(
                  selectedIcon: Image.asset(
                    home,
                    scale: 24,
                  ),
                  icon: Image.asset(
                    home,
                    scale: 24,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Image.asset(
                    calendar,
                    scale: 24,
                  ),
                  icon: Image.asset(
                    calendar,
                    scale: 24,
                  ),
                  label: 'Appointments',
                ),
                NavigationDestination(
                  selectedIcon: Image.asset(
                    user,
                    scale: 24,
                  ),
                  icon: Image.asset(
                    user,
                    scale: 24,
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
      ),
    );
  }
}

class BottomNavDashboardController extends ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;

  void changeTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
