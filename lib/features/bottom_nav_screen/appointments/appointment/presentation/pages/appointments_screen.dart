import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../../core/utils/constants/padding.dart';
import '../../../../../../core/utils/resources/components/app_bar.dart';

import '../widget/card_text.dart';
import '../widget/old_appointments_widget.dart';

import '../provider/appointments_provider.dart';
import '../widget/upcoming_appointments_widget.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBarWidget(
        bottom: false,
        arrow_back: false,
        title: 'My Appointments',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: screen_padding,
          child: Column(
            children: [
              const CardText(text: 'Upcoming Appointments'),
              Consumer<AppointmentsProvider>(builder: (context, value, _) {
                return FutureBuilder(
                    future: value.baseUpcomingAppointments(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return snapshot.data!.appointmentData!.upcoming!.isEmpty
                            ? Padding(
                                padding: screen_padding,
                                child: Column(
                                  children: [
                                    Icon(
                                      CupertinoIcons.calendar_badge_minus,
                                      size: 50,
                                      color: Colors.blue.shade800,
                                    ),
                                    SizedBox(
                                      height: mediaQuery.height * 0.01,
                                    ),
                                    const Text(
                                      'You have no upcoming\nappointments',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                            : UpcomingAppointmentsWidget(
                                snapshot: snapshot,
                              );
                      }
                    });
              }),
              const CardText(text: 'Old Appointments'),
              Consumer<AppointmentsProvider>(builder: (context, value, _) {
                return FutureBuilder(
                    future: value.baseOldAppointments(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return snapshot.data!.appointmentData!.old!.isEmpty
                            ? Padding(
                                padding: screen_padding,
                                child: Column(
                                  children: [
                                    Icon(
                                      CupertinoIcons.calendar_badge_minus,
                                      color: Colors.blue.shade800,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      height: mediaQuery.height * 0.01,
                                    ),
                                    const Text(
                                      'You have no old\nappointments',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                            : OldAppointmentsWidget(appointmentsData: snapshot);
                      }
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Color color = Colors.orange;
