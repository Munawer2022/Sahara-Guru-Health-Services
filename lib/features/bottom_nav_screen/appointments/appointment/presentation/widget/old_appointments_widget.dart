import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../pages/appointments_screen.dart';

class OldAppointmentsWidget extends StatelessWidget {
  final appointmentsData;
  const OldAppointmentsWidget({super.key, required this.appointmentsData});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: appointmentsData.data?.appointmentData?.old?.length,
        itemBuilder: (context, index) {
          String dateStr = appointmentsData
              .data!.appointmentData!.old![index].appointmentDate
              .toString();
          DateTime date = DateTime.parse(dateStr);
          String day = date.day.toString();
          //
          String monthStr = appointmentsData
              .data!.appointmentData!.old![index].appointmentDate
              .toString();
          DateTime month = DateTime.parse(dateStr);
          String monthFinal = DateFormat.MMM().format(date);

          return SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 0,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.pushNamed(
                      context, RoutesName.appointmentConfirmation, arguments: {
                    'id': appointmentsData.data?.appointmentData!.old?[index].id
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Card(
                          child: SizedBox(
                            width: 40,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: '$day\n',
                                    style: theme.textTheme.subtitle2
                                        ?.copyWith(fontWeight: FontWeight.w800),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: monthFinal,
                                        style: theme.textTheme.subtitle2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //  Container(
                        //   color: Colors.black12,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 4, vertical: 8),
                        //     child: RichText(
                        //       textAlign: TextAlign.center,
                        //       text: TextSpan(
                        //         text: '$day\n',
                        //         style: theme.textTheme.subtitle2
                        //             ?.copyWith(fontWeight: FontWeight.w800),
                        //         children: <TextSpan>[
                        //           TextSpan(
                        //             text: monthFinal,
                        //             style: theme.textTheme.subtitle2,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        title: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Card(
                                elevation: 0,
                                color: color,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Cash',
                                    // 'Rs. 2300 Remaning',
                                    style: theme.textTheme.subtitle2?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Dr. ${appointmentsData.data!.appointmentData!.old![index].doctor?.firstName} ${appointmentsData.data!.appointmentData!.old![index].doctor?.lastName ?? ''}',
                              style: theme.textTheme.subtitle2
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            text:
                                'Date: ${appointmentsData.data!.appointmentData!.old![index].appointmentDate.toString()}\n',
                            style: theme.textTheme.subtitle2,
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Time: ${appointmentsData.data!.appointmentData!.old![index].appointmentTime.toString()}',
                              ),
                            ],
                          ),
                        ),
                        trailing: Text(
                          'Fee: ${appointmentsData.data!.appointmentData!.old![index].fees.toString()}',
                          style: theme.textTheme.subtitle2
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      // SizedBox(
                      //   height: 50,
                      //   width: double.infinity,
                      //   child: TextButton(
                      //       style: ButtonStyle(
                      //           backgroundColor:
                      //               MaterialStateProperty.all(
                      //                   color)),
                      //       onPressed: () {},
                      //       child: const Text(
                      //         'Pay Now',
                      //         style: TextStyle(
                      //             color: Colors.white),
                      //       )),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
