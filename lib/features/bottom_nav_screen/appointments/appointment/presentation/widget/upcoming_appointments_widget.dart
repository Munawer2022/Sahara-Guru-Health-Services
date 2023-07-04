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

class AppointmentShimmer extends StatelessWidget {
  const AppointmentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.grey.shade300,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  width: 40,
                  height: 80,
                  child: Card(
                    color: Colors.grey.shade400,
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
                trailing: Container(
                  height: 20,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
