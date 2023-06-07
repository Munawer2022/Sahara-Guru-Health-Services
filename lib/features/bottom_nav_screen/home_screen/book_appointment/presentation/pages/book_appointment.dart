import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';

import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import 'package:provider/provider.dart';
import '../../../../../../core/utils/constants/padding.dart';
import '../../../../../../core/utils/resources/components/app_bar.dart';

import '../../../../../../core/utils/resources/components/button.dart';
import '../../../../appointments/appointment/presentation/pages/appointments_screen.dart';

import '../../../../../../core/utils/constants/images.dart';
import '../provider/bookappointment_controller.dart';

class BookAppointment extends StatefulWidget {
  dynamic routeData;
  BookAppointment({super.key, this.routeData});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  final box = GetStorage();

  String selectedDate = DateFormat("y-MM-dd").format(DateTime.now()).toString();

  bool loading = false;
  String? error;
  Future saveAppoitment(BuildContext context) async {
    setState(() {
      loading = true;
    });
    try {
      Response response = await post(
        Uri.parse(
            'https://saharadigitalhealth.in/sahara_digital_health/public/api/save-appointment?patientId=${box.read('id').toString()}&doctorId=${widget.routeData['id'].toString()}&fees=${widget.routeData['fees'].toString()}&appointmentDate=${selectedDate.toString()}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
        },
      );

      var data = jsonDecode(response.body.toString());
      debugPrint(data['message']);
      debugPrint(selectedDate);
      print(response.body);
      box.read('key');
      if (data['success'] == true) {
        setState(() {
          loading = false;
        });
        Dialogs.bottomMaterialDialog(
            msgStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            msg:
                'With Dr. ${widget.routeData['firstName'].toString()} ${widget.routeData['lastName'].toString()}\nFees : ${widget.routeData['fees'].toString()} & Date : ${data['appointment']['appointment_date']} & Time : ${data['appointment']['appointment_time']}',
            title:
                'Hey! ${box.read('first_name').toString()}\n Your Appointment Booked Successfully',
            context: context,
            actions: [
              IconsButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Okay!',
                iconData: Icons.done,
                color: Colors.green,
                textStyle: TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
            ]);

        // Utils().snackBarMessage(data['message'], context);

        // Navigator.pushNamed(context, RoutesName.appointmentConfirmation);
      } else if (data['success'] == false) {
        setState(() {
          loading = false;
        });
        error = data['message'];
        // Utils().warningSnackBarMessage(data['message'], context);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    Timer(const Duration(seconds: 5), () {
      setState(() {
        error = null;
      });
    });
  }

  dynamic month = DateFormat("M").format(DateTime.now());

  dynamic year = DateFormat("y").format(DateTime.now());

  dynamic day = [
    // 'Today',
    DateFormat("EEEE").format(DateTime.now()),
    // 'Tomorrow',
    DateFormat("EEEE").format(DateTime.now().add(const Duration(days: 1))),
    DateFormat("EEEE").format(DateTime.now().add(const Duration(days: 2))),
  ];

  dynamic date = [
    DateFormat("y-MM-dd").format(DateTime.now()),
    DateFormat("y-MM-dd").format(DateTime.now().add(const Duration(days: 1))),
    DateFormat("y-MM-dd").format(DateTime.now().add(const Duration(days: 2))),
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
            child: Column(
              children: [
                showAlert(),
                Padding(
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
                              leading: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.2),
                                        blurRadius: 10,
                                      )
                                    ]),
                                child:
                                    //  department_doctors_profiles +
                                    widget.routeData['profile'] != null
                                        ? CircleAvatar(
                                            backgroundColor: Colors.white,
                                            onBackgroundImageError:
                                                (exception, stackTrace) {},
                                            backgroundImage: NetworkImage(
                                                department_doctors_profiles +
                                                    widget.routeData['profile']
                                                        .toString()),
                                            radius: 25,
                                          )
                                        : const CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Colors.white,
                                            child: Center(
                                                child: Icon(
                                              CupertinoIcons.person_alt,
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
                              title: Text(
                                  widget.routeData['firstName'].toString(),
                                  style: theme.textTheme.headline6!
                                      .copyWith(fontWeight: FontWeight.bold)),
                              subtitle:
                                  Text(widget.routeData['fees'].toString(),
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
                                          width: mediaQuery.width * 0.3,
                                          child: Center(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(day[index],
                                                  style: theme
                                                      .textTheme.subtitle2),
                                              Text(date[index].toString(),
                                                  style: theme
                                                      .textTheme.subtitle2),
                                            ],
                                          )),
                                        ),
                                        selected: value.value == index,
                                        onSelected: (bool selected) {
                                          // setState(() {
                                          //   error = null;
                                          // });
                                          print(
                                            date[value.value].toString(),
                                          );
                                          debugPrint(selectedDate);
                                          value.changeTabIndex(index);
                                          selectedDate =
                                              date[value.value].toString();
                                        },
                                      )),
                                ),
                              ),
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
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                  Text(widget.routeData['bio'].toString(),
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
              ],
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
                    loading: loading,
                    title: 'Confirm Booking',
                    onTap: () {
                      // Navigator.pushNamed(
                      //     context, RoutesName.appointmentConfirmation);
                      // saveAppoitment(context);
                      // DateTime tempDate =  DateFormat().parse(selectedDate);
                      saveAppoitment(context);
                      // var a = '';
                      // // Jiffy.parse("2019-10-18").yMMMMd;

                      // final scaffold = ScaffoldMessenger.of(context);
                      // scaffold.showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       a.toString(),
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //     action: SnackBarAction(
                      //         label: 'OK',
                      //         onPressed: scaffold.hideCurrentSnackBar),
                      //   ),
                      // );
                    },
                  )
                ],
              ),
            ),
          ));
    });
  }

  Widget showAlert() {
    if (error != null) {
      return Container(
        color: Colors.amber.shade200,
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.error_outline,
              ),
            ),
            Expanded(
              child: Text(
                error.toString(),
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return const SizedBox(
      height: 0,
    );
  }
}
