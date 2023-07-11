import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ripple/flutter_ripple.dart';

import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:sahara_guru_health_services/core/utils/constants/images.dart';

import '../../../core/utils/resources/components/app_bar.dart';

import '../../../core/utils/constants/padding.dart';
import '../../../core/utils/utils.dart';
import 'all_speciallzations/data/models/all_speciallzations_model.dart';
import 'all_speciallzations/presentation/pages/home_slide_horizontal_list.dart';

import '../../../config/routes/routes_names.dart';

import '../../../core/utils/resources/components/button.dart';
import 'all_speciallzations/presentation/provider/all_speciallzations_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = GetStorage();

  List iamges = [brainstorm, baby, neurology, skin, hospital];

  @override
  Widget build(BuildContext context) {
    debugPrint('home');
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Scaffold(
      body: MyAppBarWidget(
        readOnly: true,
        ontap: () {
          Navigator.pushNamed(context, RoutesName.searchdoctor);
        },
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
        delegate: SliverChildListDelegate([
          Padding(
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
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Utils().snackBarMessage(context);
                                },
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
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                            ),
                            SizedBox(
                              width: mediaQuery.width * 0.01,
                            ),
                            SizedBox(
                              height: 200,
                              width: mediaQuery.width * 0.4,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  Utils().snackBarMessage(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffd5d4fe)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15, top: 15),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('Video\nConsultation',
                                              style: theme.textTheme.bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.02,
                        ),
                        SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Utils().snackBarMessage(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffc6ddfd)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          height: mediaQuery.height * 0.05,
                                          width: mediaQuery.width * 0.5,
                                          // height: 30,
                                          // width: 200,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff010066),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    '92 doctors online now',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                  FlutterRipple(
                                                    radius: 8,
                                                    child: null,
                                                    rippleColor:
                                                        const Color.fromARGB(
                                                            255, 35, 245, 42),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(instant)
                                ],
                              ),
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
                Consumer<AllSpeciallzationsProvider>(
                    builder: (context, value, _) {
                  return FutureBuilder<AllSpeciallzationsModel>(
                      future: value.baseAllSpeciallzations(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Column(
                            children: [
                              Card(
                                elevation: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: card_padding,
                                      child: Text("I'm Looking For",
                                          style: theme.textTheme.headline6
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 80,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: InkWell(
                                            onTap: () {},
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                ),
                                                SizedBox(
                                                  height:
                                                      mediaQuery.height * 0.01,
                                                ),
                                                Container(
                                                  height: 15,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: card_padding,
                                        child: Button(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                RoutesName.allSpeciallzations);
                                          },
                                          title: 'All Speciallzations',
                                        )),
                                  ],
                                ),
                              ),
                              Card(
                                  elevation: 0,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: card_padding,
                                          child: Text(
                                            "Previous Doctors",
                                            style: theme.textTheme.headline6
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 80,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          mediaQuery.height *
                                                              0.01,
                                                    ),
                                                    Container(
                                                      height: 15,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: mediaQuery.height * 0.03,
                                        ),
                                      ])),
                              Card(
                                  elevation: 0,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: card_padding,
                                          child: Text(
                                            "Popular Doctors",
                                            style: theme.textTheme.headline6
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 80,
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          mediaQuery.height *
                                                              0.01,
                                                    ),
                                                    Container(
                                                      height: 15,
                                                      width: 70,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: mediaQuery.height * 0.03,
                                        ),
                                      ])),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Padding(
                            padding: screen_padding,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '!Oops',
                                  style: theme.textTheme.displayLarge,
                                ),
                                SizedBox(
                                  height: mediaQuery.height * 0.01,
                                ),
                                Text(
                                  snapshot.error.toString(),
                                ),
                              ],
                            ),
                          ));
                        } else {
                          return snapshot.data!.departments!.isEmpty
                              ? const Center(child: Text('Empty'))
                              : Column(
                                  children: [
                                    Card(
                                      elevation: 0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: card_padding,
                                            child: Text("I'm Looking For",
                                                style: theme.textTheme.headline6
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: mediaQuery.height * 0.12,
                                            // height: 80,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: (snapshot
                                                                .data
                                                                ?.departments
                                                                ?.length ??
                                                            0) >
                                                        4
                                                    ? 5
                                                    : (snapshot
                                                            .data
                                                            ?.departments
                                                            ?.length ??
                                                        0),
                                                itemBuilder: (context, index) {
                                                  if (index < 4) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 12),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              RoutesName
                                                                  .catagoryDoctor,
                                                              arguments: {
                                                                'department_id':
                                                                    snapshot
                                                                        .data!
                                                                        .departments![
                                                                            index]
                                                                        .id,
                                                                'name': snapshot
                                                                    .data!
                                                                    .departments![
                                                                        index]
                                                                    .name
                                                              });
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // Image(
                                                            //   image: AssetImage(iamges[index]),
                                                            //   height: 40,
                                                            //   width: 40,
                                                            // ),
                                                            Container(
                                                                height: 50,
                                                                width: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    begin: Alignment
                                                                        .topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    colors: [
                                                                      Colors
                                                                          .blue
                                                                          .shade100,
                                                                      Colors
                                                                          .grey
                                                                          .shade200
                                                                    ],
                                                                  ),

                                                                  // boxShadow: <BoxShadow>[
                                                                  //   BoxShadow(
                                                                  //     color:
                                                                  //         Colors.black.withOpacity(.2),
                                                                  //     blurRadius: 10,
                                                                  //   ),
                                                                  // ],
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                ),
                                                                child: Center(
                                                                  child: Image(
                                                                    image: AssetImage(
                                                                        iamges[
                                                                            index]),
                                                                    height: 30,
                                                                    width: 30,
                                                                  ),
                                                                )),
                                                            SizedBox(
                                                              height: mediaQuery
                                                                      .height *
                                                                  0.01,
                                                            ),
                                                            Text(
                                                                snapshot
                                                                    .data!
                                                                    .departments![
                                                                        index]
                                                                    .name
                                                                    .toString(),
                                                                style: theme
                                                                    .textTheme
                                                                    .subtitle2),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  } else if (index == 4 &&
                                                      (snapshot
                                                                  .data
                                                                  ?.departments
                                                                  ?.length ??
                                                              0) >
                                                          4) {
                                                    return IconButton(
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              RoutesName
                                                                  .allSpeciallzations);
                                                        },
                                                        icon: const Icon(
                                                            CupertinoIcons
                                                                .arrow_right));
                                                    // Return an empty widget if index exceeds 4
                                                  } else {
                                                    return const SizedBox
                                                        .shrink();
                                                  }
                                                }),
                                          ),
                                          Padding(
                                              padding: card_padding,
                                              child: Button(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      RoutesName
                                                          .allSpeciallzations);
                                                },
                                                title: 'All Speciallzations',
                                              )),
                                        ],
                                      ),
                                    ),
                                    Card(
                                        elevation: 0,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: card_padding,
                                                child: Text(
                                                  "Previous Doctors",
                                                  style: theme
                                                      .textTheme.headline6
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                height:
                                                    mediaQuery.height * 0.12,
                                                // height: 80,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: (snapshot
                                                                    .data
                                                                    ?.departments
                                                                    ?.length ??
                                                                0) >
                                                            4
                                                        ? 5
                                                        : (snapshot
                                                                .data
                                                                ?.departments
                                                                ?.length ??
                                                            0),
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (index < 4) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12),
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  RoutesName
                                                                      .catagoryDoctor,
                                                                  arguments: {
                                                                    'department_id': snapshot
                                                                        .data!
                                                                        .departments![
                                                                            index]
                                                                        .id,
                                                                    'name': snapshot
                                                                        .data!
                                                                        .departments![
                                                                            index]
                                                                        .name
                                                                  });
                                                            },
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                // Image(
                                                                //   image: AssetImage(iamges[index]),
                                                                //   height: 40,
                                                                //   width: 40,
                                                                // ),
                                                                Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      gradient:
                                                                          LinearGradient(
                                                                        begin: Alignment
                                                                            .topCenter,
                                                                        end: Alignment
                                                                            .bottomCenter,
                                                                        stops: [
                                                                          0.0,
                                                                          1.0
                                                                        ],
                                                                        colors: [
                                                                          Colors
                                                                              .blue
                                                                              .shade100,
                                                                          Colors
                                                                              .grey
                                                                              .shade200
                                                                        ],
                                                                      ),

                                                                      // boxShadow: <BoxShadow>[
                                                                      //   BoxShadow(
                                                                      //     color:
                                                                      //         Colors.black.withOpacity(.2),
                                                                      //     blurRadius: 10,
                                                                      //   ),
                                                                      // ],
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Image(
                                                                        image: AssetImage(
                                                                            iamges[index]),
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                      ),
                                                                    )),
                                                                SizedBox(
                                                                  height: mediaQuery
                                                                          .height *
                                                                      0.01,
                                                                ),
                                                                Text(
                                                                    snapshot
                                                                        .data!
                                                                        .departments![
                                                                            index]
                                                                        .name
                                                                        .toString(),
                                                                    style: theme
                                                                        .textTheme
                                                                        .subtitle2),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      } else if (index == 4 &&
                                                          (snapshot
                                                                      .data
                                                                      ?.departments
                                                                      ?.length ??
                                                                  0) >
                                                              4) {
                                                        return IconButton(
                                                            onPressed: () {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  RoutesName
                                                                      .allSpeciallzations);
                                                            },
                                                            icon: const Icon(
                                                                CupertinoIcons
                                                                    .arrow_right));
                                                        // Return an empty widget if index exceeds 4
                                                      } else {
                                                        return const SizedBox
                                                            .shrink();
                                                      }
                                                    }),
                                              ),
                                              SizedBox(
                                                height:
                                                    mediaQuery.height * 0.03,
                                              ),
                                            ])),
                                    Card(
                                        elevation: 0,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: card_padding,
                                                child: Text(
                                                  "Popular Doctors",
                                                  style: theme
                                                      .textTheme.headline6
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                height:
                                                    mediaQuery.height * 0.12,
                                                // height: 80,
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: (snapshot
                                                                    .data
                                                                    ?.departments
                                                                    ?.length ??
                                                                0) >
                                                            4
                                                        ? 5
                                                        : (snapshot
                                                                .data
                                                                ?.departments
                                                                ?.length ??
                                                            0),
                                                    itemBuilder:
                                                        (context, index) {
                                                      if (index < 4) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12),
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  RoutesName
                                                                      .catagoryDoctor,
                                                                  arguments: {
                                                                    'department_id': snapshot
                                                                        .data!
                                                                        .departments![
                                                                            index]
                                                                        .id,
                                                                    'name': snapshot
                                                                        .data!
                                                                        .departments![
                                                                            index]
                                                                        .name
                                                                  });
                                                            },
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                // Image(
                                                                //   image: AssetImage(iamges[index]),
                                                                //   height: 40,
                                                                //   width: 40,
                                                                // ),
                                                                Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      gradient:
                                                                          LinearGradient(
                                                                        begin: Alignment
                                                                            .topCenter,
                                                                        end: Alignment
                                                                            .bottomCenter,
                                                                        stops: [
                                                                          0.0,
                                                                          1.0
                                                                        ],
                                                                        colors: [
                                                                          Colors
                                                                              .blue
                                                                              .shade100,
                                                                          Colors
                                                                              .grey
                                                                              .shade200
                                                                        ],
                                                                      ),

                                                                      // boxShadow: <BoxShadow>[
                                                                      //   BoxShadow(
                                                                      //     color:
                                                                      //         Colors.black.withOpacity(.2),
                                                                      //     blurRadius: 10,
                                                                      //   ),
                                                                      // ],
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Image(
                                                                        image: AssetImage(
                                                                            iamges[index]),
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            30,
                                                                      ),
                                                                    )),
                                                                SizedBox(
                                                                  height: mediaQuery
                                                                          .height *
                                                                      0.01,
                                                                ),
                                                                Text(
                                                                    snapshot
                                                                        .data!
                                                                        .departments![
                                                                            index]
                                                                        .name
                                                                        .toString(),
                                                                    style: theme
                                                                        .textTheme
                                                                        .subtitle2),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      } else if (index == 4 &&
                                                          (snapshot
                                                                      .data
                                                                      ?.departments
                                                                      ?.length ??
                                                                  0) >
                                                              4) {
                                                        return IconButton(
                                                            onPressed: () {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  RoutesName
                                                                      .allSpeciallzations);
                                                            },
                                                            icon: const Icon(
                                                                CupertinoIcons
                                                                    .arrow_right));
                                                        // Return an empty widget if index exceeds 4
                                                      } else {
                                                        return const SizedBox
                                                            .shrink();
                                                      }
                                                    }),
                                              ),
                                              SizedBox(
                                                height:
                                                    mediaQuery.height * 0.03,
                                              ),
                                            ])),
                                  ],
                                );
                        }
                      });
                }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
