import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

import 'package:sahara_guru_health_services/core/utils/resources/components/button.dart';

import '../../../../../../../config/routes/routes_names.dart';
import '../../../../../provider/bookappointment_controller.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

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
                          leading: const CircleAvatar(
                            radius: 40,
                          ),
                          trailing: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Change',
                              )),
                          title: Text('Dr. Salman Mansoor',
                              style: theme.textTheme.headline6!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('.The Skin (DHA Phase 6)',
                                  style: theme.textTheme.subtitle2),
                              Text('Fee: Rs.2500',
                                  style: theme.textTheme.subtitle2!
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.02,
                        ),
                        Container(
                          height: 26,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.radio_button_off_rounded,
                                color: Colors.blue.shade800,
                                size: 15,
                              ),
                              SizedBox(
                                width: mediaQuery.width * 0.01,
                              ),
                              Text('Rs.200 OFF on ONLINE PAYMENT',
                                  style: theme.textTheme.subtitle2!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade800)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        SizedBox(
                          height: mediaQuery.height * 0.01,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: ChoiceChip(
                                label: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('Today'),
                                      Text('15'),
                                    ],
                                  )),
                                ),
                                selected: value.value == index,
                                onSelected: (bool selected) {
                                  value.changeTabIndex(index);
                                },
                              ),
                            ),
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

                        Padding(
                          padding: card_padding,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('Evening Slots',
                                style: theme.textTheme.subtitle2),
                          ),
                        ),

                        Wrap(
                            spacing: 8.0,
                            children: List<Widget>.generate(5, (int index) {
                              debugPrint('ChoiceChip2');
                              return ChoiceChip(
                                label: const Text(
                                  '01:40 PM',
                                ),
                                selected: value.value2 == index,
                                onSelected: (bool selected) {
                                  value.changeTabIndex2(index);
                                },
                              );
                            })),
                        SizedBox(
                          height: mediaQuery.height * 0.3,
                        )
                      ],
                    ),
                  ),
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
                      Text('Mar 15, 01:40 PM', style: theme.textTheme.subtitle2)
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Button(
                    title: 'Confirm Booking',
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.appointmentConfirmation);
                    },
                  )
                ],
              ),
            ),
          ));
    });
  }
}
