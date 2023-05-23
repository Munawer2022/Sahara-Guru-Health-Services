import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

import '../../../../../../../../../config/routes/routes_names.dart';
import '../../../../../../widgets/list_tile.dart';
import '../get_list_doctor_model.dart';

class AppointmentConfirmation extends StatelessWidget {
  AppointmentConfirmation({super.key});
  final box = GetStorage();

  // Future doctorAppointmnet() async {
  //   try {
  //     Response response = await post(
  //       Uri.parse(
  //           'https://saharadigitalhealth.in/sahara_digital_health/public/api/save-appointment'),
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer ${box.read('token')}'
  //       },
  //       body: {
  //         'patientId':
  //         'doctorId':
  //         'fees':
  //         'appointmentDate':
  //       }
  //     );
  //     var data = jsonDecode(response.body.toString());
  //     if (response.statusCode == 400) {
  //       if (kDebugMode) {
  //         print(data);
  //       }

  //     }else {

  //       if (kDebugMode) {
  //         print('failed');
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  //   throw {};
  // }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBarWidget(
        arrow_back: true,
        title: 'Appointment Confirmaiton',
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.appointmentDetail);
              },
              child: const Text('Done'))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: screen_padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline_sharp,
                      size: 50,
                      color: Colors.green.shade700,
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.01,
                    ),
                    Text('Your in-person appointment\nhas been booked!',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headline6
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: card_padding,
                          child: Column(
                            children: [
                              Text(
                                  'Share your medical records with Assist.\nProf. Dr. Sana Younas',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.subtitle2
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: mediaQuery.height * 0.01,
                              ),
                              TextButton.icon(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.amber.shade600)),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.playlist_add_circle_rounded,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Add Medical Records',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 0,
                        child: Padding(
                          padding: card_padding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Appointment Details',
                                  style: theme.textTheme.headline6
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const Divider(
                                color: Colors.black12,
                              ),
                              listTile('Patient Name', 'Assed',
                                  CupertinoIcons.person),
                              listTile(
                                  'Appointment Time',
                                  '04 May 2023, 7:00 PM',
                                  CupertinoIcons.calendar),
                              listTile(
                                  'Doctor Name',
                                  'Assist. Prof. Dr. Sana Younas at Surgimed Hospital ',
                                  Icons.medical_information_outlined),
                              listTile(
                                  'Appointment Fee',
                                  'Rs. 2300 (To be paid at Clinic)',
                                  CupertinoIcons.folder_open),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: mediaQuery.height * 0.12,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.deepPurple.shade900,
                    Colors.blue.shade700,
                  ],
                )),
                child: Padding(
                  padding: card_padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Rs.200 OFF on ONLINE PAYMENT',
                          style: theme.textTheme.subtitle2
                              ?.copyWith(color: Colors.white)),
                      SizedBox(
                        width: mediaQuery.width * 0.03,
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        // width: mediaQuery.width * 0.25,
                        child: TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: const BorderSide(
                                            color: Colors.white))),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            onPressed: () {},
                            child: Center(
                                child: Text('Pay Now',
                                    style: theme.textTheme.subtitle2
                                        ?.copyWith(color: Colors.white)))),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
