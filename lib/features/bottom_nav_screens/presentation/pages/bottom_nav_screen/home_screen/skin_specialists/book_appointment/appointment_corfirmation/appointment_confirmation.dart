import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

import '../../../../../../../../../config/routes/routes_names.dart';
import '../../../../../../widgets/list_tile.dart';

import 'appointment_confirmation_model.dart';

class AppointmentConfirmation extends StatelessWidget {
  dynamic para;
  AppointmentConfirmation({super.key, required this.para});
  final box = GetStorage();
  Future<AppointmentConfirmationModel> appointmentConfirmation() async {
    Response response = await get(
      Uri.parse(
          'https://saharadigitalhealth.in/sahara_digital_health/public/api/fetch/single/appointment?appointmentId=${para['id'].toString()}'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      },
    );
    var data = jsonDecode(response.body.toString());
    debugPrint(data.toString());
    if (response.statusCode == 200) {
      return AppointmentConfirmationModel.fromJson(data);
    }

    throw {};
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBarWidget(
        bottom: false,
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
              FutureBuilder<AppointmentConfirmationModel>(
                future: appointmentConfirmation(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: screen_padding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: Card(
                          //     elevation: 0,
                          //     child: Padding(
                          //       padding: card_padding,
                          //       child: Column(
                          //         children: [
                          //           Text(
                          //               'Share your medical records with Assist.\nDr. ${snapshot.data?.appointmentDetails?.doctor?.firstName.toString()}',
                          //               textAlign: TextAlign.center,
                          //               style: theme.textTheme.subtitle2
                          //                   ?.copyWith(
                          //                       fontWeight: FontWeight.bold)),
                          //           SizedBox(
                          //             height: mediaQuery.height * 0.01,
                          //           ),
                          //           TextButton.icon(
                          //               style: ButtonStyle(
                          //                   backgroundColor:
                          //                       MaterialStateProperty.all(
                          //                           Colors.amber.shade600)),
                          //               onPressed: () {},
                          //               icon: const Icon(
                          //                 Icons.playlist_add_circle_rounded,
                          //                 color: Colors.white,
                          //               ),
                          //               label: const Text(
                          //                 'Add Medical Records',
                          //                 style: TextStyle(color: Colors.white),
                          //               ))
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            width: double.infinity,
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding: card_padding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.check_circle_outline_sharp,
                                        size: 50,
                                        color: Colors.green.shade700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: mediaQuery.height * 0.01,
                                    ),
                                    Text(
                                        'Your in-person appointment\nhas been booked!',
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.headline6
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: mediaQuery.height * 0.05,
                                    ),
                                    Text('Appointment Details',
                                        style: theme.textTheme.headline6),
                                    SizedBox(
                                      height: mediaQuery.height * 0.02,
                                    ),
                                    listTile(
                                        'Patient Name',
                                        snapshot.data?.appointmentDetails
                                            ?.patient?.firstName
                                            .toString(),
                                        CupertinoIcons.person_alt_circle),
                                    listTile(
                                        'Appointment Time',
                                        '${snapshot.data?.appointmentDetails?.appointmentDate.toString()}, ${snapshot.data?.appointmentDetails?.appointmentTime.toString()}',
                                        CupertinoIcons.time),
                                    listTile(
                                        'Doctor Name',
                                        '${snapshot.data?.appointmentDetails?.doctor?.firstName.toString()} ${snapshot.data?.appointmentDetails?.doctor?.lastName.toString()}',
                                        //at Surgimed Hospital
                                        CupertinoIcons.person_alt_circle),
                                    listTile(
                                        'Appointment Fee',
                                        snapshot.data?.appointmentDetails?.fees
                                            .toString(),
                                        // 'Rs. 2300 (To be paid at Clinic)',
                                        Icons.money),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              // Container(
              //   width: double.infinity,
              //   height: mediaQuery.height * 0.12,
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //     begin: Alignment.topRight,
              //     end: Alignment.bottomLeft,
              //     colors: [
              //       Colors.deepPurple.shade900,
              //       Colors.blue.shade700,
              //     ],
              //   )),
              //   child: Padding(
              //     padding: card_padding,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text('Rs.200 OFF on ONLINE PAYMENT',
              //             style: theme.textTheme.subtitle2
              //                 ?.copyWith(color: Colors.white)),
              //         SizedBox(
              //           width: mediaQuery.width * 0.03,
              //         ),
              //         SizedBox(
              //           height: 50,
              //           width: 100,
              //           // width: mediaQuery.width * 0.25,
              //           child: TextButton(
              //               style: ButtonStyle(
              //                   shape: MaterialStateProperty.all<
              //                           RoundedRectangleBorder>(
              //                       RoundedRectangleBorder(
              //                           borderRadius:
              //                               BorderRadius.circular(5.0),
              //                           side: const BorderSide(
              //                               color: Colors.white))),
              //                   backgroundColor: MaterialStateProperty.all(
              //                       Colors.transparent)),
              //               onPressed: () {},
              //               child: Center(
              //                   child: Text('Pay Now',
              //                       style: theme.textTheme.subtitle2
              //                           ?.copyWith(color: Colors.white)))),
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
