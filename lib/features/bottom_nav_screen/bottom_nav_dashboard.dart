import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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
