import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/config/routes/routes_names.dart';

import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/data/models/upcoming_appointment_model.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/presentation/widget/card_text.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/presentation/widget/old_appointments_widget.dart';

import '../../../../../core/error/status.dart';
import '../../data/models/old_appointment_model.dart';
import '../provider/appointments_provider.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final box = GetStorage();
  // AppointmentsProvider appointmentsProvider = AppointmentsProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // appointmentsProvider.baseOldAppointments();

    upcomingMyAppointment();
  }

  // Future<OldMyAppointmentModel> oldMyAppointment() async {
  //   Response response = await get(
  //     Uri.parse(
  //         'https://saharadigitalhealth.in/sahara_digital_health/public/api/patient/appointments'),
  //     headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${box.read('token')}'
  //     },
  //   );
  //   var data = jsonDecode(response.body.toString());
  //   // debugPrint(data.toString());
  //   if (response.statusCode == 200) {
  //     return OldMyAppointmentModel.fromJson(data);
  //   }

  //   throw {};
  // }

  Future<UpcomingMyAppointmentModel> upcomingMyAppointment() async {
    Response response = await get(
      Uri.parse(
          'https://saharadigitalhealth.in/sahara_digital_health/public/api/patient/appointments'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      },
    );
    var data = jsonDecode(response.body.toString());
    // debugPrint(data.toString());
    if (response.statusCode == 200) {
      return UpcomingMyAppointmentModel.fromJson(data);
    }

    throw {};
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
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
              FutureBuilder<UpcomingMyAppointmentModel>(
                  future: upcomingMyAppointment(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: const Text("got error"));
                    }
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              snapshot.data?.appointmentData?.upcoming?.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: double.infinity,
                              child: Card(
                                elevation: 0,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        RoutesName.appointmentConfirmation,
                                        arguments: {
                                          'id': snapshot.data?.appointmentData!
                                              .upcoming?[index].id
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Container(
                                            color: Colors.black12,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 8),
                                              child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  text: '04\n',
                                                  style: theme
                                                      .textTheme.subtitle2
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w800),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: 'MAY',
                                                      style: theme
                                                          .textTheme.subtitle2,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          title: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Card(
                                                  elevation: 0,
                                                  color: color,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                      'Cash',
                                                      // 'Rs. 2300 Remaning',
                                                      style: theme
                                                          .textTheme.subtitle2
                                                          ?.copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Dr. ${snapshot.data!.appointmentData!.upcoming![index].doctor?.firstName.toString()} ${snapshot.data!.appointmentData!.upcoming![index].doctor?.lastName.toString()}',
                                                style: theme.textTheme.subtitle2
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          subtitle: RichText(
                                            text: TextSpan(
                                              text:
                                                  'Date: ${snapshot.data!.appointmentData!.upcoming![index].appointmentDate.toString()}\n',
                                              style: theme.textTheme.subtitle2,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      'Time: ${snapshot.data!.appointmentData!.upcoming![index].appointmentTime.toString()}',
                                                ),
                                              ],
                                            ),
                                          ),
                                          trailing: Text(
                                            'Fee: ${snapshot.data!.appointmentData!.upcoming![index].fees.toString()}',
                                            style: theme.textTheme.subtitle2
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: mediaQuery.height * 0.01,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return const Center(child: Text("NA State"));
                  }),
              const CardText(text: 'Old Appointments'),
              Consumer<AppointmentsProvider>(builder: (context, value, _) {
                return FutureBuilder<OldMyAppointmentModel>(
                    future: value.baseOldAppointments(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(child: Text('error'));
                      }
                      if (snapshot.hasData) {
                        return OldAppointmentsWidget(
                            appointmentsData: snapshot);
                      }
                      return const Center(child: CircularProgressIndicator());
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
