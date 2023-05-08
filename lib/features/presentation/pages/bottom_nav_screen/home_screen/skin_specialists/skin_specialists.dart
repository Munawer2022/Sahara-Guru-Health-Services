import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/search_text_field_component.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';

import '../../../../../../config/routes/routes_names.dart';

class SkinSpecialists extends StatelessWidget {
  const SkinSpecialists({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    debugPrint('SkinSpecialists');
    return Scaffold(
        appBar: MyAppBarWidget(
          arrow_back: true,
          title: 'Skin Specialists in Karachi',
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.call))],
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: screen_padding,
                        child: const SearchTextFieldComponent(
                            text:
                                'Doctors, hospitals, specialties, services, diseases'),
                      ),
                    ),
                    Padding(
                      padding: screen_padding,
                      child: Text('Top 372 Dermatogists in Karachi',
                          style: theme.textTheme.subtitle2),
                    ),
                  ],
                ),
                Flexible(
                  // height: 612,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) => Padding(
                            padding: screen_padding,
                            child: Card(
                              elevation: 0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: card_padding,
                                    child: ListTile(
                                      title: Text('Dr. Salman Mansoor',
                                          style: theme.textTheme.headline6!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold)),
                                      leading: const CircleAvatar(
                                        radius: 25,
                                      ),
                                      subtitle: Text(
                                          'Dermatologist, Aesthetic Physician, Laser Specialist, Cosmetologist MBBS, MD (USA), D Derm (London)...',
                                          maxLines: 2,
                                          style: theme.textTheme.subtitle2),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text: 'Under 15 Min\n',
                                            style: theme.textTheme.subtitle2!
                                                .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Wait Time',
                                                style: theme
                                                    .textTheme.subtitle2!
                                                    .copyWith(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text: '22 Years\n',
                                            style: theme.textTheme.subtitle2!
                                                .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Experience',
                                                style: theme
                                                    .textTheme.subtitle2!
                                                    .copyWith(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text: '95% (4161)\n',
                                            style: theme.textTheme.subtitle2!
                                                .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Satisfied',
                                                style: theme
                                                    .textTheme.subtitle2!
                                                    .copyWith(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: card_padding,
                                    child: Card(
                                      child: Padding(
                                        padding: card_padding,
                                        child: Text(
                                            '"Dr. Salman is one of the top doctors, He is highly qulaified, intelligent and very punctual, Really satisfi...',
                                            style: theme.textTheme.subtitle2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Container(
                                          height: mediaQuery.height * 0.13,
                                          width: mediaQuery.width * 0.75,
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                color: Colors.grey.shade300,
                                              )),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                  title: Text(
                                                      '.The Skin (DHA Phase 6)',
                                                      style: theme
                                                          .textTheme.subtitle2),
                                                  trailing: Text('Rs. 2500',
                                                      style: theme
                                                          .textTheme.subtitle2),
                                                  subtitle: Row(
                                                    children: [
                                                      Container(
                                                        height: 8,
                                                        width: 8,
                                                        decoration:
                                                            const BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                shape: BoxShape
                                                                    .circle),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            mediaQuery.width *
                                                                0.01,
                                                      ),
                                                      Text(
                                                        'Available today',
                                                        style: theme.textTheme
                                                            .subtitle2!
                                                            .copyWith(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .green),
                                                      )
                                                    ],
                                                  )),
                                              Container(
                                                height: 26,
                                                width: mediaQuery.width * 0.75,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue.shade800,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12))),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Icon(
                                                      Icons
                                                          .radio_button_off_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                    SizedBox(
                                                      width: mediaQuery.width *
                                                          0.01,
                                                    ),
                                                    Text(
                                                        'Rs.200 OFF on ONLINE PAYMENT',
                                                        style: theme.textTheme
                                                            .subtitle2!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white)),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: mediaQuery.height * 0.01,
                                  // ),
                                  Padding(
                                    padding: card_padding,
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blue.shade800)
                                              // backgroundColor:
                                              //     MaterialStateProperty.all(
                                              //         Colors.grey.shade300)
                                              // elevation: MaterialStateProperty.all(2)
                                              ),
                                          onPressed: () {
                                            Navigator.pushNamed(context,
                                                RoutesName.bookappointment);
                                          },
                                          child: const Center(
                                              child: Text(
                                            'Book Appointment',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ]),
        ));
  }
}
