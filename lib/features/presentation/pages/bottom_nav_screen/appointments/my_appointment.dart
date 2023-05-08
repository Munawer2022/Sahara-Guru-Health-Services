import 'package:flutter/material.dart';

import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: const MyAppBarWidget(
        arrow_back: false,
        title: 'My Appointments',
      ),
      body: Padding(
        padding: screen_padding,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 0,
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
                                color: Colors.orange,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Rs. 2300 Remaning',
                                    style: theme.textTheme.subtitle2?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Assist. Prof. Dr. Sana Younas',
                              style: theme.textTheme.subtitle2
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            text: 'Surgimed Hospital\n',
                            style: theme.textTheme.subtitle2,
                            children: const <TextSpan>[
                              TextSpan(
                                text: 'Assed . Thursday, 07:40 pm',
                              ),
                            ],
                          ),
                        ),
                        trailing: Text(
                          'Fee: 2500',
                          style: theme.textTheme.subtitle2
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange)),
                            onPressed: () {},
                            child: const Text(
                              'Pay Now',
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
