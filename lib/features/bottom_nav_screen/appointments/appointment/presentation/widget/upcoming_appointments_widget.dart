import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../pages/appointments_screen.dart';

class UpcomingAppointmentsWidget extends StatelessWidget {
  final snapshot;
  const UpcomingAppointmentsWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: snapshot.data?.appointmentData?.upcoming?.length,
        itemBuilder: (context, index) {
          String dateStr = snapshot
              .data!.appointmentData!.upcoming![index].appointmentDate
              .toString();
          DateTime date = DateTime.parse(dateStr);
          String day = date.day.toString();
          //
          String monthStr = snapshot
              .data!.appointmentData!.upcoming![index].appointmentDate
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
                    'id': snapshot.data?.appointmentData!.upcoming?[index].id
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
                              'Dr. ${snapshot.data!.appointmentData!.upcoming![index].doctor?.firstName.toString()} ${snapshot.data!.appointmentData!.upcoming![index].doctor?.lastName.toString()}',
                              style: theme.textTheme.subtitle2
                                  ?.copyWith(fontWeight: FontWeight.bold),
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
                              ?.copyWith(fontWeight: FontWeight.bold),
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
}
