import 'package:flutter/material.dart';

import '../../../../../config/routes/routes_names.dart';
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
                        leading: Container(
                          color: Colors.black12,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 8),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: '04\n',
                                style: theme.textTheme.subtitle2
                                    ?.copyWith(fontWeight: FontWeight.w800),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'MAY',
                                    style: theme.textTheme.subtitle2,
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
                              'Dr. ${appointmentsData.data!.appointmentData!.old![index].doctor?.firstName.toString()} ${appointmentsData.data!.appointmentData!.old![index].doctor?.lastName.toString()}',
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
