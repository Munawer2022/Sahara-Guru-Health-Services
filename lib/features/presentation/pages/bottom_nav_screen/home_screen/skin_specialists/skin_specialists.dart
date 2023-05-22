import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/utils/constants/images.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/search_text_field_component.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/features/presentation/widgets/slide_horizontal_list.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../../../../../../core/utils/constants/app_url.dart';
import '../../../../../data/repositories/get_list_doctor_respository.dart';
import 'book_appointment/get_list_doctor_model.dart';

class SkinSpecialists extends StatefulWidget {
  dynamic data;
  SkinSpecialists({super.key, required this.data});

  @override
  State<SkinSpecialists> createState() => _SkinSpecialistsState();
}

class _SkinSpecialistsState extends State<SkinSpecialists> {
  final box = GetStorage();

  Future<Getlistdoctor> getlistdoctor() async {
    try {
      Response response = await get(
        Uri.parse(
            'https://saharadigitalhealth.in/sahara_digital_health/public/api/department/doctors/list?departmentId=${widget.data['department_id'].toString()}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}'
        },
      );
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(data);
        }

        return Getlistdoctor.fromJson(data);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    throw {};
  }

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
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.allspeciallzations);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                              child: Text(
                                'Doctors, hospitals, specialties, services, diseases',
                                style: theme.textTheme.subtitle2!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: screen_padding,
                      child: Text('Top 372 Dermatogists in Karachi',
                          style: theme.textTheme.subtitle2),
                    ),
                  ],
                ),
                FutureBuilder<Getlistdoctor>(
                  future: getlistdoctor(),
                  //AsyncSnapshot<Getlistdoctor>
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    // if (!snapshot.hasData) {
                    //   return Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // }

                    if (snapshot.hasData) {
                      return Flexible(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                snapshot.data!.departments![0].doctors?.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: screen_padding,
                                  child: Card(
                                    elevation: 0,
                                    child: Padding(
                                      padding: card_padding,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                                snapshot.data!.departments![0]
                                                    .doctors![index].firstName
                                                    .toString(),
                                                style: theme
                                                    .textTheme.headline6!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            leading: CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              radius: 27,
                                              child: snapshot
                                                          .data!
                                                          .departments![0]
                                                          .doctors![index]
                                                          .profile !=
                                                      null
                                                  ? CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      onBackgroundImageError:
                                                          (exception,
                                                              stackTrace) {},
                                                      backgroundImage: NetworkImage(
                                                          department_doctors_profiles +
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
                                                        Icons.person,
                                                        size: 40,
                                                        color: Colors.grey,
                                                      )),
                                                    ),
                                            ),
                                            subtitle: Text(
                                                snapshot.data!.departments![0]
                                                    .doctors![index].lastName
                                                    .toString(),
                                                maxLines: 2,
                                                style:
                                                    theme.textTheme.subtitle2),
                                          ),
                                          SizedBox(
                                              height: mediaQuery.height * 0.02),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  text: 'Fees\n',
                                                  style: theme
                                                      .textTheme.subtitle2!
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: snapshot
                                                              .data!
                                                              .departments![0]
                                                              .doctors![index]
                                                              .fees ??
                                                          'N/A',
                                                      style: theme
                                                          .textTheme.subtitle2!
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  text: '22 Years\n',
                                                  style: theme
                                                      .textTheme.subtitle2!
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: 'Experience',
                                                      style: theme
                                                          .textTheme.subtitle2!
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                  text: '95% (4161)\n',
                                                  style: theme
                                                      .textTheme.subtitle2!
                                                      .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: 'Satisfied',
                                                      style: theme
                                                          .textTheme.subtitle2!
                                                          .copyWith(
                                                              fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height: mediaQuery.height * 0.02),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Card(
                                              child: Padding(
                                                padding: card_padding,
                                                child: Text(
                                                    snapshot
                                                            .data!
                                                            .departments![0]
                                                            .doctors![index]
                                                            .bio ??
                                                        'N/A',
                                                    textAlign: TextAlign.center,
                                                    // '"Dr. Salman is one of the top doctors, He is highly qulaified, intelligent and very punctual, Really satisfi...',
                                                    style: theme
                                                        .textTheme.subtitle2),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: double.infinity,
                                          //   height: 100,
                                          //   child: ListView.builder(
                                          //     shrinkWrap: true,
                                          //     physics:
                                          //         const BouncingScrollPhysics(),
                                          //     scrollDirection: Axis.horizontal,
                                          //     itemCount: 10,
                                          //     itemBuilder: (context, index) =>
                                          //         Padding(
                                          //       padding:
                                          //           const EdgeInsets.symmetric(
                                          //               horizontal: 12),
                                          //       child: Container(
                                          //         height:
                                          //             mediaQuery.height * 0.13,
                                          //         width: mediaQuery.width * 0.75,
                                          //         decoration: BoxDecoration(
                                          //             color: Colors.transparent,
                                          //             borderRadius:
                                          //                 BorderRadius.circular(
                                          //                     12),
                                          //             border: Border.all(
                                          //               color:
                                          //                   Colors.grey.shade300,
                                          //             )),
                                          //         child: Column(
                                          //           children: [
                                          //             ListTile(
                                          //                 title: Text(
                                          //                     '.The Skin (DHA Phase 6)',
                                          //                     style: theme
                                          //                         .textTheme
                                          //                         .subtitle2),
                                          //                 trailing: Text(
                                          //                     'Rs. 2500',
                                          //                     style: theme
                                          //                         .textTheme
                                          //                         .subtitle2),
                                          //                 subtitle: Row(
                                          //                   children: [
                                          //                     Container(
                                          //                       height: 8,
                                          //                       width: 8,
                                          //                       decoration: const BoxDecoration(
                                          //                           color: Colors
                                          //                               .green,
                                          //                           shape: BoxShape
                                          //                               .circle),
                                          //                     ),
                                          //                     SizedBox(
                                          //                       width: mediaQuery
                                          //                               .width *
                                          //                           0.01,
                                          //                     ),
                                          //                     Text(
                                          //                       'Available today',
                                          //                       style: theme
                                          //                           .textTheme
                                          //                           .subtitle2!
                                          //                           .copyWith(
                                          //                               fontSize:
                                          //                                   12,
                                          //                               color: Colors
                                          //                                   .green),
                                          //                     )
                                          //                   ],
                                          //                 )),
                                          //             Container(
                                          //               height: 26,
                                          //               width: mediaQuery.width *
                                          //                   0.75,
                                          //               decoration: BoxDecoration(
                                          //                   color: Colors
                                          //                       .blue.shade800,
                                          //                   borderRadius:
                                          //                       const BorderRadius
                                          //                               .only(
                                          //                           bottomLeft: Radius
                                          //                               .circular(
                                          //                                   12),
                                          //                           bottomRight: Radius
                                          //                               .circular(
                                          //                                   12))),
                                          //               child: Row(
                                          //                 mainAxisAlignment:
                                          //                     MainAxisAlignment
                                          //                         .center,
                                          //                 children: [
                                          //                   const Icon(
                                          //                     Icons
                                          //                         .radio_button_off_rounded,
                                          //                     color: Colors.white,
                                          //                     size: 15,
                                          //                   ),
                                          //                   SizedBox(
                                          //                     width: mediaQuery
                                          //                             .width *
                                          //                         0.01,
                                          //                   ),
                                          //                   Text(
                                          //                       'Rs.200 OFF on ONLINE PAYMENT',
                                          //                       style: theme
                                          //                           .textTheme
                                          //                           .subtitle2!
                                          //                           .copyWith(
                                          //                               fontWeight:
                                          //                                   FontWeight
                                          //                                       .bold,
                                          //                               color: Colors
                                          //                                   .white)),
                                          //                 ],
                                          //               ),
                                          //             )
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          SizedBox(
                                              height: mediaQuery.height * 0.02),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors
                                                                .blue.shade800)
                                                    // backgroundColor:
                                                    //     MaterialStateProperty.all(
                                                    //         Colors.grey.shade300)
                                                    // elevation: MaterialStateProperty.all(2)
                                                    ),
                                                onPressed: () {
                                                  Navigator.pushNamed(
                                                      context,
                                                      RoutesName
                                                          .bookappointment,
                                                      arguments: {
                                                        'fees': snapshot
                                                            .data!
                                                            .departments![0]
                                                            .doctors[index]
                                                            .fees,
                                                        'bio': snapshot
                                                                .data!
                                                                .departments![0]
                                                                .doctors[index]
                                                                .bio ??
                                                            'N/A',
                                                        'id': snapshot
                                                            .data!
                                                            .departments![0]
                                                            .doctors[index]
                                                            .id,
                                                        'firstName': snapshot
                                                            .data!
                                                            .departments![0]
                                                            .doctors[index]
                                                            .firstName,
                                                        'lastName': snapshot
                                                            .data!
                                                            .departments![0]
                                                            .doctors[index]
                                                            .lastName,
                                                        'profile': snapshot
                                                            .data!
                                                            .departments![0]
                                                            .doctors[index]
                                                            .profile,
                                                      });
                                                },
                                                child: const Center(
                                                    child: Text(
                                                  'Book Appointment',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      );
                    }
                    return Flexible(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) => Padding(
                                padding: screen_padding,
                                child: Card(
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
                                                  color: Colors.grey.shade400,
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
                                                  color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            )),
                                        SizedBox(
                                            height: mediaQuery.height * 0.02),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 10,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                ),
                                                SizedBox(
                                                  height:
                                                      mediaQuery.height * 0.01,
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                ),
                                                SizedBox(
                                                  height:
                                                      mediaQuery.height * 0.01,
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                ),
                                                SizedBox(
                                                  height:
                                                      mediaQuery.height * 0.01,
                                                ),
                                                Container(
                                                  height: 10,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                            height: mediaQuery.height * 0.02),
                                        SizedBox(
                                          width: double.infinity,
                                          height: mediaQuery.height * 0.08,
                                          child: Card(
                                            elevation: 0,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        SizedBox(
                                            height: mediaQuery.height * 0.02),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: 40,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    );
                  },
                ),

                // Flexible(
                //   // height: 612,
                //   child: ListView.builder(
                //       physics: const NeverScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       itemCount: 10,
                //       itemBuilder: (context, index) => Padding(
                //             padding: screen_padding,
                //             child: Card(
                //               elevation: 0,
                //               child: Column(
                //                 children: [
                //                   Padding(
                //                     padding: card_padding,
                //                     child: ListTile(
                //                       title: Text('Dr. Salman Mansoor',
                //                           style: theme.textTheme.headline6!
                //                               .copyWith(
                //                                   fontWeight: FontWeight.bold)),
                //                       leading: const CircleAvatar(
                //                         radius: 25,
                //                       ),
                //                       subtitle: Text(
                //                           'Dermatologist, Aesthetic Physician, Laser Specialist, Cosmetologist MBBS, MD (USA), D Derm (London)...',
                //                           maxLines: 2,
                //                           style: theme.textTheme.subtitle2),
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.symmetric(
                //                         horizontal: 30, vertical: 15),
                //                     child: Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         RichText(
                //                           textAlign: TextAlign.center,
                //                           text: TextSpan(
                //                             text: 'Under 15 Min\n',
                //                             style: theme.textTheme.subtitle2!
                //                                 .copyWith(
                //                               fontWeight: FontWeight.bold,
                //                             ),
                //                             children: <TextSpan>[
                //                               TextSpan(
                //                                 text: 'Wait Time',
                //                                 style: theme
                //                                     .textTheme.subtitle2!
                //                                     .copyWith(fontSize: 12),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                         RichText(
                //                           textAlign: TextAlign.center,
                //                           text: TextSpan(
                //                             text: '22 Years\n',
                //                             style: theme.textTheme.subtitle2!
                //                                 .copyWith(
                //                               fontWeight: FontWeight.bold,
                //                             ),
                //                             children: <TextSpan>[
                //                               TextSpan(
                //                                 text: 'Experience',
                //                                 style: theme
                //                                     .textTheme.subtitle2!
                //                                     .copyWith(fontSize: 12),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                         RichText(
                //                           textAlign: TextAlign.center,
                //                           text: TextSpan(
                //                             text: '95% (4161)\n',
                //                             style: theme.textTheme.subtitle2!
                //                                 .copyWith(
                //                               fontWeight: FontWeight.bold,
                //                             ),
                //                             children: <TextSpan>[
                //                               TextSpan(
                //                                 text: 'Satisfied',
                //                                 style: theme
                //                                     .textTheme.subtitle2!
                //                                     .copyWith(fontSize: 12),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: card_padding,
                //                     child: Card(
                //                       child: Padding(
                //                         padding: card_padding,
                //                         child: Text(
                //                             '"Dr. Salman is one of the top doctors, He is highly qulaified, intelligent and very punctual, Really satisfi...',
                //                             style: theme.textTheme.subtitle2),
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     width: double.infinity,
                //                     height: 100,
                //                     child: ListView.builder(
                //                       shrinkWrap: true,
                //                       physics: const BouncingScrollPhysics(),
                //                       scrollDirection: Axis.horizontal,
                //                       itemCount: 10,
                //                       itemBuilder: (context, index) => Padding(
                //                         padding: const EdgeInsets.symmetric(
                //                             horizontal: 12),
                //                         child: Container(
                //                           height: mediaQuery.height * 0.13,
                //                           width: mediaQuery.width * 0.75,
                //                           decoration: BoxDecoration(
                //                               color: Colors.transparent,
                //                               borderRadius:
                //                                   BorderRadius.circular(12),
                //                               border: Border.all(
                //                                 color: Colors.grey.shade300,
                //                               )),
                //                           child: Column(
                //                             children: [
                //                               ListTile(
                //                                   title: Text(
                //                                       '.The Skin (DHA Phase 6)',
                //                                       style: theme
                //                                           .textTheme.subtitle2),
                //                                   trailing: Text('Rs. 2500',
                //                                       style: theme
                //                                           .textTheme.subtitle2),
                //                                   subtitle: Row(
                //                                     children: [
                //                                       Container(
                //                                         height: 8,
                //                                         width: 8,
                //                                         decoration:
                //                                             const BoxDecoration(
                //                                                 color: Colors
                //                                                     .green,
                //                                                 shape: BoxShape
                //                                                     .circle),
                //                                       ),
                //                                       SizedBox(
                //                                         width:
                //                                             mediaQuery.width *
                //                                                 0.01,
                //                                       ),
                //                                       Text(
                //                                         'Available today',
                //                                         style: theme.textTheme
                //                                             .subtitle2!
                //                                             .copyWith(
                //                                                 fontSize: 12,
                //                                                 color: Colors
                //                                                     .green),
                //                                       )
                //                                     ],
                //                                   )),
                //                               Container(
                //                                 height: 26,
                //                                 width: mediaQuery.width * 0.75,
                //                                 decoration: BoxDecoration(
                //                                     color: Colors.blue.shade800,
                //                                     borderRadius:
                //                                         const BorderRadius.only(
                //                                             bottomLeft:
                //                                                 Radius.circular(
                //                                                     12),
                //                                             bottomRight:
                //                                                 Radius.circular(
                //                                                     12))),
                //                                 child: Row(
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.center,
                //                                   children: [
                //                                     const Icon(
                //                                       Icons
                //                                           .radio_button_off_rounded,
                //                                       color: Colors.white,
                //                                       size: 15,
                //                                     ),
                //                                     SizedBox(
                //                                       width: mediaQuery.width *
                //                                           0.01,
                //                                     ),
                //                                     Text(
                //                                         'Rs.200 OFF on ONLINE PAYMENT',
                //                                         style: theme.textTheme
                //                                             .subtitle2!
                //                                             .copyWith(
                //                                                 fontWeight:
                //                                                     FontWeight
                //                                                         .bold,
                //                                                 color: Colors
                //                                                     .white)),
                //                                   ],
                //                                 ),
                //                               )
                //                             ],
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   // SizedBox(
                //                   //   height: mediaQuery.height * 0.01,
                //                   // ),
                //                   Padding(
                //                     padding: card_padding,
                //                     child: Row(
                //                       children: [
                //                         ElevatedButton(
                //                           style: ButtonStyle(
                //                               backgroundColor:
                //                                   MaterialStateProperty.all(
                //                                       Colors.blue.shade800)
                //                               // backgroundColor:
                //                               //     MaterialStateProperty.all(
                //                               //         Colors.grey.shade300)
                //                               // elevation: MaterialStateProperty.all(2)
                //                               ),
                //                           onPressed: () {
                //                             Navigator.pushNamed(context,
                //                                 RoutesName.bookappointment);
                //                           },
                //                           child: const Center(
                //                               child: Text(
                //                             'Book Appointment',
                //                             style:
                //                                 TextStyle(color: Colors.white),
                //                           )),
                //                         ),
                //                       ],
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           )),
                // ),
              ]),
        ));
  }
}
