import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../../core/utils/constants/padding.dart';
import '../../../../../../core/utils/resources/components/app_bar.dart';
import '../../data/models/upcoming_appointment_model.dart';
import '../widget/card_text.dart';
import '../widget/old_appointments_widget.dart';

import '../../../../../../core/error/status.dart';
import '../../data/models/old_appointment_model.dart';
import '../provider/appointments_provider.dart';
import '../widget/upcoming_appointments_widget.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        return UpcomingAppointmentsWidget(
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
                        return OldAppointmentsWidget(
                            appointmentsData: snapshot);
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
