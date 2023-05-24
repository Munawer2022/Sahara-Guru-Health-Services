import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

import 'package:sahara_guru_health_services/core/utils/resources/components/button.dart';

import '../../../../../../../../config/routes/routes_names.dart';
import '../../../../../../../../core/utils/constants/images.dart';
import '../../../../../provider/bookappointment_controller.dart';

class BookAppointment extends StatelessWidget {
  dynamic routeData;
  BookAppointment({super.key, this.routeData});
  final box = GetStorage();
  String selectedDate = DateFormat("d/M/y").format(DateTime.now()).toString();

  Future saveAppoitment(BuildContext context) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://saharadigitalhealth.in/sahara_digital_health/public/api/save-appointment'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          },
          body: {
            'patientId': box.read('id').toString(),
            'doctorId': routeData['id'].toString(),
            'fees': routeData['fees'].toString(),
            'appointmentDate': selectedDate
            // '2023-05-18',
          });
      var data = jsonDecode(response.body.toString());
      box.read('key');
      if (data['success'] == true) {
        Navigator.pushNamed(context, RoutesName.appointmentConfirmation);
      } else if (data['success'] == false) {
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          SnackBar(
            content: Text(data['message']),
            action: SnackBarAction(
                label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  dynamic month = DateFormat("M").format(DateTime.now());
  dynamic year = DateFormat("y").format(DateTime.now());
  dynamic day = [
    // 'Today',
    DateFormat("EEEE").format(DateTime.now()),
    // 'Tomorrow',
    DateFormat("EEEE").format(DateTime.now().add(Duration(days: 1))),
    DateFormat("EEEE").format(DateTime.now().add(Duration(days: 2))),
  ];
  dynamic date = [
    DateFormat("d/M/y").format(DateTime.now()),
    DateFormat("d/M/y").format(DateTime.now().add(Duration(days: 1))),
    DateFormat("d/M/y").format(DateTime.now().add(Duration(days: 2))),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint('BookAppointment');
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Consumer<BookAppointmentController>(
        builder: (context, value, child) {
      debugPrint('ChoiceChip');
      return Scaffold(
          appBar: const MyAppBarWidget(
            bottom: false,
            arrow_back: true,
            title: 'Select a Time Slot',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: screen_padding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: mediaQuery.height * 0.01,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 27,
                            child:
                                //  department_doctors_profiles +
                                routeData['profile'] != null
                                    ? CircleAvatar(
                                        backgroundColor: Colors.white,
                                        onBackgroundImageError:
                                            (exception, stackTrace) {},
                                        backgroundImage: NetworkImage(
                                            department_doctors_profiles +
                                                routeData['profile']
                                                    .toString()),
                                        radius: 25,
                                      )
                                    : const CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.white,
                                        child: Center(
                                            child: Icon(
                                          Icons.person,
                                          size: 40,
                                          color: Colors.grey,
                                        )),
                                      ),
                          ),
                          trailing: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Change',
                              )),
                          title: Text(routeData['firstName'].toString(),
                              style: theme.textTheme.headline6!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          subtitle: Text(routeData['fees'].toString(),
                              // box.read('fees').toString(),
                              style: theme.textTheme.subtitle2),
                        ),

                        // SizedBox(
                        //   height: mediaQuery.height * 0.02,
                        // ),
                        // Container(
                        //   height: 26,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey.shade300,
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Icon(
                        //         Icons.radio_button_off_rounded,
                        //         color: Colors.blue.shade800,
                        //         size: 15,
                        //       ),
                        //       SizedBox(
                        //         width: mediaQuery.width * 0.01,
                        //       ),
                        //       Text('Rs.200 OFF on ONLINE PAYMENT',
                        //           style: theme.textTheme.subtitle2!.copyWith(
                        //               fontWeight: FontWeight.bold,
                        //               color: Colors.blue.shade800)),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: mediaQuery.height * 0.01,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ChoiceChip(
                                    label: SizedBox(
                                      height: 50,
                                      width: 80,
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(day[index],
                                              style: theme.textTheme.subtitle2),
                                          Text(date[index].toString(),
                                              style: theme.textTheme.subtitle2),
                                        ],
                                      )),
                                    ),
                                    selected: value.value == index,
                                    onSelected: (bool selected) {
                                      debugPrint(selectedDate);
                                      value.changeTabIndex(index);
                                      selectedDate =
                                          date[value.value].toString();
                                    },
                                  )),
                            ),
                          ),

                          // Row(
                          //   children: [
                          //     Icon(
                          //       Icons.sunny_snowing,
                          //     ),
                          //     SizedBox(
                          //       width: mediaQuery.width * 0.01,
                          //     ),
                          //     Text('Afternoon Slots',
                          //         style: theme.textTheme.subtitle2)
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: mediaQuery.height * 0.02,
                          // ),
                          // Wrap(
                          //     spacing: 8.0,
                          //     children: List<Widget>.generate(3, (int index) {
                          //       print('ChoiceChip1');
                          //       return ChoiceChip(
                          //         label: const Text(
                          //           '01:40 PM',
                          //         ),
                          //         selected: value.value1 == index,
                          //         onSelected: (bool selected) {
                          //           value.changeTabIndex1(index);
                          //         },
                          //       );
                          //     })),
                          // SizedBox(
                          //   height: mediaQuery.height * 0.03,
                          // ),

                          // Padding(
                          //   padding: card_padding,
                          //   child: Align(
                          //     alignment: Alignment.bottomLeft,
                          //     child: Text('Evening Slots',
                          //         style: theme.textTheme.subtitle2),
                          //   ),
                          // ),

                          // Wrap(
                          //     spacing: 8.0,
                          //     children: List<Widget>.generate(5, (int index) {
                          //       debugPrint('ChoiceChip2');
                          //       return ChoiceChip(
                          //         label: const Text(
                          //           '01:40 PM',
                          //         ),
                          //         selected: value.value2 == index,
                          //         onSelected: (bool selected) {
                          //           value.changeTabIndex2(index);
                          //         },
                          //       );
                          //     })),
                          // SizedBox(
                          //   height: mediaQuery.height * 0.3,
                          // )
                        ],
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('About Doctor',
                                  style: theme.textTheme.headline6!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              Text(routeData['bio'].toString(),
                                  style: theme.textTheme.subtitle2),
                            ],
                          ),
                        )),
                  ),
                  // TimePickerDialog(
                  //   initialTime: TimeOfDay.now(),
                  // ),

                  SizedBox(
                    height: mediaQuery.height * 0.2,
                  )
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            height: 130,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                  color: Colors.grey,
                )
              ],
            ),
            child: Padding(
              padding: card_padding,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.01,
                      ),
                      // selectedDate = Text(date[value.value]),
                      // selectedDate =
                      //     //  year[value.value]
                      //     //     month[value.value]
                      //     date[value.value],
                      Text("${day[value.value]} ${date[value.value]}",
                          style: theme.textTheme.subtitle2)
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Button(
                    title: 'Confirm Booking',
                    onTap: () {
                      // Navigator.pushNamed(
                      //     context, RoutesName.appointmentConfirmation);
                      // saveAppoitment(context);
                      // DateTime tempDate =  DateFormat().parse(selectedDate);

                      var a = '';
                      // Jiffy.parse("2019-10-18").yMMMMd;
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: Text(
                            a.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          action: SnackBarAction(
                              label: 'OK',
                              onPressed: scaffold.hideCurrentSnackBar),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ));
    });
  }
}
