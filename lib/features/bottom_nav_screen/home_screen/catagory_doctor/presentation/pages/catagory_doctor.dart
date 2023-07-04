import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/catagory_doctor/presentation/provider/catagory_doctor_provider.dart';

import '../../../../../../core/utils/constants/images.dart';
import '../../../../../../core/utils/resources/components/app_bar.dart';

import '../../../../../../core/utils/constants/padding.dart';

import '../../../../../../config/routes/routes_names.dart';

import '../../data/models/get_list_doctor_model.dart';

class CatagoryDoctorScreen extends StatefulWidget {
  dynamic data;
  CatagoryDoctorScreen({super.key, required this.data});

  @override
  State<CatagoryDoctorScreen> createState() => _CatagoryDoctorScreenState();
}

class _CatagoryDoctorScreenState extends State<CatagoryDoctorScreen> {
  CatagoryDoctorProvider catagoryDoctorProvider = CatagoryDoctorProvider();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    debugPrint('SkinSpecialists');

    return Scaffold(
        body: MyAppBarWidget(
            readOnly: true,
            ontap: () {
              Navigator.pushNamed(context, RoutesName.searchdoctor);
            },
            bottomText: 'Doctors, hospitals, specialties, services, diseases',
            arrow_back: true,
            title: '${widget.data['name'].toString()} Catagory',
            delegate: SliverChildListDelegate([
              FutureBuilder<Getlistdoctor>(
                future: catagoryDoctorProvider
                    .getlistdoctor(widget.data['department_id'].toString()),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Flexible(
                      child: Padding(
                        padding: screen_padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: mediaQuery.width * 0.40,
                              height: mediaQuery.height * 0.02,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            SizedBox(
                              height: mediaQuery.height * 0.01,
                            ),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) => Card(
                                      color: Colors.grey.shade300,
                                      elevation: 0,
                                      child: Padding(
                                        padding: card_padding,
                                        child: Column(
                                          children: [
                                            ListTile(
                                                title: Container(
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                ),
                                                leading: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey.shade400,
                                                  radius: 27,
                                                ),
                                                subtitle: Container(
                                                  height: 12,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                )),
                                            SizedBox(
                                                height:
                                                    mediaQuery.height * 0.02),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade400,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          mediaQuery.height *
                                                              0.01,
                                                    ),
                                                    Container(
                                                      height: 10,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade400,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade400,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          mediaQuery.height *
                                                              0.01,
                                                    ),
                                                    Container(
                                                      height: 10,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade400,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade400,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          mediaQuery.height *
                                                              0.01,
                                                    ),
                                                    Container(
                                                      height: 10,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade400,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                height:
                                                    mediaQuery.height * 0.02),
                                            SizedBox(
                                              width: double.infinity,
                                              height: mediaQuery.height * 0.08,
                                              child: Card(
                                                elevation: 0,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                            SizedBox(
                                                height:
                                                    mediaQuery.height * 0.02),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                height: 40,
                                                width: 150,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade400,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return snapshot.data?.departments![0].doctors?.length == 0
                        ? Column(
                            children: [
                              Image.asset(
                                no_data,
                                scale: 6,
                              ),
                              ListTile(
                                  title: Center(
                                    child: Text(
                                        'Empty ${widget.data['name'].toString()} \nCatagory',
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.headline6),
                                  ),
                                  subtitle: const Center(
                                    child: Text(
                                      "\nSorry, Doctor's empty in this catagory",
                                    ),
                                  )),
                            ],
                          )
                        : Flexible(
                            child: Padding(
                              padding: screen_padding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                        'Top ${snapshot.data?.departments![0].doctors?.length.toString()} Dermatogists',
                                        style: theme.textTheme.subtitle2),
                                  ),
                                  SizedBox(
                                    height: mediaQuery.height * 0.01,
                                  ),
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.departments![0]
                                          .doctors?.length,
                                      itemBuilder: (context, index) => Card(
                                            elevation: 0,
                                            child: Padding(
                                              padding: card_padding,
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                        snapshot
                                                            .data!
                                                            .departments![0]
                                                            .doctors![index]
                                                            .firstName
                                                            .toString(),
                                                        style: theme.textTheme
                                                            .headline6!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                    leading: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          boxShadow: <
                                                              BoxShadow>[
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      .2),
                                                              blurRadius: 10,
                                                            )
                                                          ]),

                                                      // backgroundColor: Colors.white,
                                                      // radius: 27,
                                                      child: snapshot
                                                                  .data!
                                                                  .departments![
                                                                      0]
                                                                  .doctors![
                                                                      index]
                                                                  .profile !=
                                                              null
                                                          ? CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              onBackgroundImageError:
                                                                  (exception,
                                                                      stackTrace) {},
                                                              backgroundImage: NetworkImage(department_doctors_profiles +
                                                                  snapshot
                                                                      .data!
                                                                      .departments![
                                                                          0]
                                                                      .doctors![
                                                                          index]
                                                                      .profile
                                                                      .toString()),
                                                              radius: 25,
                                                            )
                                                          : const CircleAvatar(
                                                              radius: 25,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              child: Center(
                                                                  child: Icon(
                                                                CupertinoIcons
                                                                    .person_alt,
                                                                size: 40,
                                                                color:
                                                                    Colors.grey,
                                                              )),
                                                            ),
                                                    ),
                                                    subtitle: Text(
                                                        snapshot
                                                                .data!
                                                                .departments![0]
                                                                .doctors![index]
                                                                .lastName ??
                                                            '',
                                                        maxLines: 2,
                                                        style: theme.textTheme
                                                            .subtitle2),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          mediaQuery.height *
                                                              0.02),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      RichText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text: TextSpan(
                                                          text: 'Fees\n',
                                                          style: theme.textTheme
                                                              .subtitle2!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: snapshot
                                                                      .data!
                                                                      .departments![
                                                                          0]
                                                                      .doctors![
                                                                          index]
                                                                      .fees ??
                                                                  'N/A',
                                                              style: theme
                                                                  .textTheme
                                                                  .subtitle2!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      RichText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text: TextSpan(
                                                          text: '22 Years\n',
                                                          style: theme.textTheme
                                                              .subtitle2!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text:
                                                                  'Experience',
                                                              style: theme
                                                                  .textTheme
                                                                  .subtitle2!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      RichText(
                                                        textAlign:
                                                            TextAlign.center,
                                                        text: TextSpan(
                                                          text: '95% (4161)\n',
                                                          style: theme.textTheme
                                                              .subtitle2!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                              text: 'Satisfied',
                                                              style: theme
                                                                  .textTheme
                                                                  .subtitle2!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          12),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          mediaQuery.height *
                                                              0.02),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: Card(
                                                      child: Padding(
                                                        padding: card_padding,
                                                        child: Text(
                                                            snapshot
                                                                    .data!
                                                                    .departments![
                                                                        0]
                                                                    .doctors![
                                                                        index]
                                                                    .bio ??
                                                                'N/A',
                                                            maxLines: 3,
                                                            textAlign: TextAlign
                                                                .center,
                                                            // '"Dr. Salman is one of the top doctors, He is highly qulaified, intelligent and very punctual, Really satisfi...',
                                                            style: theme
                                                                .textTheme
                                                                .subtitle2),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          mediaQuery.height *
                                                              0.02),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            )),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(Color(
                                                                        0xff010066))),
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              RoutesName
                                                                  .bookappointment,
                                                              arguments: {
                                                                'fees': snapshot
                                                                    .data!
                                                                    .departments![
                                                                        0]
                                                                    .doctors[
                                                                        index]
                                                                    .fees,
                                                                'bio': snapshot
                                                                        .data!
                                                                        .departments![
                                                                            0]
                                                                        .doctors[
                                                                            index]
                                                                        .bio ??
                                                                    'N/A',
                                                                'id': snapshot
                                                                    .data!
                                                                    .departments![
                                                                        0]
                                                                    .doctors[
                                                                        index]
                                                                    .id,
                                                                'firstName': snapshot
                                                                    .data!
                                                                    .departments![
                                                                        0]
                                                                    .doctors[
                                                                        index]
                                                                    .firstName,
                                                                'lastName': snapshot
                                                                    .data!
                                                                    .departments![
                                                                        0]
                                                                    .doctors[
                                                                        index]
                                                                    .lastName,
                                                                'profile': snapshot
                                                                    .data!
                                                                    .departments![
                                                                        0]
                                                                    .doctors[
                                                                        index]
                                                                    .profile,
                                                              });
                                                        },
                                                        child: const Center(
                                                            child: Text(
                                                          'Book Appointment',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                ],
                              ),
                            ),
                          );
                  }
                },
              )
            ])));
  }
}
