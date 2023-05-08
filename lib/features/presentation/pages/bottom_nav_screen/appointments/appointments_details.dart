import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';

class AppointmentsDetails extends StatelessWidget {
  const AppointmentsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Appointments Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                  elevation: 0,
                  child: ListTile(
                    leading: const CircleAvatar(),
                    trailing: TextButton(
                        onPressed: () {}, child: const Text('status')),
                    title: RichText(
                      text: TextSpan(
                        text: 'Emial\n',
                        style: theme.textTheme.headline6,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Name\n', style: theme.textTheme.headline6),
                          TextSpan(
                              text: 'Designation\n',
                              style: theme.textTheme.headline6),
                          TextSpan(
                              text: 'Department',
                              style: theme.textTheme.headline6),
                        ],
                      ),
                    ),
                  )),
              Card(
                elevation: 0,
                child: Padding(
                  padding: screen_padding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Today', style: theme.textTheme.headline6),
                      Text('15', style: theme.textTheme.headline6),
                      Text('Drescribtion', style: theme.textTheme.headline6),
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'A medical note from the doctor confirms the legitimacy of time missed by an employee or student. It certifies a doctor appointment with a health care provider, and the date(s) upon which the doctor visit occurred. The doctor letter may also assess the patient’s health condition and the amount of sick time they need.',
                            style: theme.textTheme.subtitle2),
                      )),
                      Card(
                        child: ListTile(
                          trailing: TextButton(
                              onPressed: () {}, child: Text('7 Days')),
                          title: RichText(
                            text: TextSpan(
                              text: 'Medicine\n',
                              style: theme.textTheme.headline6,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Name\n',
                                    style: theme.textTheme.subtitle2),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text('Note', style: theme.textTheme.headline6),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'A medical note from the doctor confirms the legitimacy of time missed by an employee or student. It certifies a doctor appointment with a health care provider, and the date(s) upon which the doctor visit occurred. The doctor letter may also assess the patient’s health condition and the amount of sick time they need.',
                              style: theme.textTheme.subtitle2),
                        ),
                      ),
                      Text('Texts', style: theme.textTheme.headline6),
                      Card(
                          child: ListTile(
                        trailing: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Data\nDownloard',
                              textAlign: TextAlign.center,
                            )),
                        title: RichText(
                          text: TextSpan(
                            text: 'Text Name\n',
                            style: theme.textTheme.headline6,
                            children: <TextSpan>[],
                          ),
                        ),
                      )),
                      Text('Reffered Doctor', style: theme.textTheme.headline6),
                      Card(
                          child: ListTile(
                        trailing: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Status',
                            )),
                        title: RichText(
                          text: TextSpan(
                            text: 'Name\n',
                            style: theme.textTheme.headline6,
                            children: const <TextSpan>[],
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
