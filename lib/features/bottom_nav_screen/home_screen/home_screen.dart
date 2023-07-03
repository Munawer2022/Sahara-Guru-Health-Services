import 'package:flutter/material.dart';
import 'package:flutter_ripple/flutter_ripple.dart';

import 'package:get_storage/get_storage.dart';
import 'package:sahara_guru_health_services/core/utils/constants/images.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/appointment/presentation/pages/appointments_screen.dart';

import '../../../core/utils/resources/components/app_bar.dart';

import '../../../core/utils/constants/padding.dart';
import '../../../core/utils/utils.dart';
import 'all_speciallzations/presentation/pages/home_slide_horizontal_list.dart';

import '../../../config/routes/routes_names.dart';

import '../../../core/utils/resources/components/button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    debugPrint('home');
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBarWidget(
        readOnly: true,
        ontap: () {
          Navigator.pushNamed(context, RoutesName.searchdoctor);
        },
        bottom: true,
        bottomText: 'Find Dectors, Specialities, Disease and Hospital',
        arrow_back: false,
        title: 'Sara Health',
        actions: [
          IconButton(
              onPressed: () {
                box.remove('token').then((value) {
                  box.remove('profile');
                  box.remove('first_name');
                  box.remove('last_name');
                  box.remove('email');
                  box.remove('phone_number');
                  Navigator.pushNamed(context, RoutesName.loginscreen);
                }).onError((error, stackTrace) {
                  Utils().errorSnackBarMessage(error.toString(), context);
                });
              },
              icon: const Icon(
                Icons.power_settings_new_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: screen_padding,
          child: Column(
            children: [
              Card(
                elevation: 0,
                child: Padding(
                  padding: card_padding,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 200,
                            width: mediaQuery.width * 0.4,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffffd79c)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: card_padding,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Doctor\nAppointment',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Image.asset(
                                    appointment,
                                    scale: 7,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: mediaQuery.width * 0.01,
                          ),
                          SizedBox(
                            height: 200,
                            width: mediaQuery.width * 0.4,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffd5d4fe)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: card_padding,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Video\nConsultation',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Stack(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      children: [
                                        Image.asset(
                                          mobile,
                                          height: 130,
                                        ),
                                        Image.asset(
                                          consultation,
                                          scale: 25,
                                        )
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.02,
                      ),
                      SizedBox(
                        height: 110,
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffc6ddfd)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Instant Video Consultation',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff010066))),
                                  SizedBox(
                                    height: mediaQuery.height * 0.01,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff010066),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              '92 doctors online now',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 11),
                                            ),
                                            FlutterRipple(
                                              radius: 10,
                                              child: null,
                                              rippleColor: const Color.fromARGB(
                                                  255, 35, 245, 42),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(instant)
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: mediaQuery.height * 0.02,
                      // ),
                      // SizedBox(
                      //   height: 110,
                      //   width: double.infinity,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.grey.shade300,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Card(
                  elevation: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: card_padding,
                          child: Text(
                            "I'm Looking For",
                            style: theme.textTheme.headline6,
                          ),
                        ),
                        const HomeSlideHorizontalList(),
                        Padding(
                            padding: card_padding,
                            child: Button(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesName.allSpeciallzations);
                              },
                              title: 'All Speciallzations',
                            )),
                      ])),
              Card(
                  elevation: 0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: card_padding,
                          child: Text(
                            "Previous Doctors",
                            style: theme.textTheme.headline6,
                          ),
                        ),
                        const HomeSlideHorizontalList(),
                        SizedBox(
                          height: mediaQuery.height * 0.03,
                        ),
                      ])),
              Card(
                  elevation: 0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: card_padding,
                          child: Text(
                            "Popular Doctors",
                            style: theme.textTheme.headline6,
                          ),
                        ),
                        const HomeSlideHorizontalList(),
                        SizedBox(
                          height: mediaQuery.height * 0.03,
                        ),
                      ])),
            ],
          ),
        ),
      ),
    );
  }
}
