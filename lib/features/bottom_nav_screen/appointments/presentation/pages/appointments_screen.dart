import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/data/models/upcoming_appointment_model.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/presentation/widget/card_text.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/presentation/widget/old_appointments_widget.dart';

import '../../../../../core/error/status.dart';
import '../../data/models/old_appointment_model.dart';
import '../provider/appointments_provider.dart';
import '../widget/upcoming_appointments_widget.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  // Future<OldMyAppointmentModel> oldMyAppointment() async {
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
                return FutureBuilder<UpcomingMyAppointmentModel>(
                    future: value.baseUpcomingAppointments(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text("got error ${snapshot.error}"));
                      } else {
                        return UpcomingAppointmentsWidget(
                          snapshot: snapshot,
                        );
                      }
                    });
              }),
              const CardText(text: 'Old Appointments'),
              Consumer<AppointmentsProvider>(builder: (context, value, _) {
                return FutureBuilder<OldMyAppointmentModel>(
                    future: value.baseOldAppointments(),
                    builder: (context, snapshot) {
                      // switch (value.oldappointmnetsResponse.status) {
                      //   case Status.LOADING:
                      //     return Center(child: CircularProgressIndicator());
                      //   case Status.ERROR:
                      //     return Center(
                      //         child: Text(value.oldappointmnetsResponse.message
                      //             .toString()));
                      //   case Status.COMPLETED:

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text("got error ${snapshot.error}"));
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
