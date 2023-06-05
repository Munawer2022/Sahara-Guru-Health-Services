import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/appointments/presentation/pages/appointments_screen.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/all_speciallzations/catagory_doctor/book_appointment/appointment_confirmation/presentation/provider/appointment_confirmation_provider.dart';

import '../../../../../../../../../config/routes/routes_names.dart';
import '../../../../../../../../widgets/list_tile.dart';

import '../../data/models/appointment_confirmation_model.dart';

class AppointmentConfirmationScreen extends StatelessWidget {
  dynamic para;
  AppointmentConfirmationScreen({super.key, required this.para});
  // final box = GetStorage();
  // Future<AppointmentConfirmationModel> appointmentConfirmation() async {
  //   Response response = await get(
  //     Uri.parse(
  //         'https://saharadigitalhealth.in/sahara_digital_health/public/api/fetch/single/appointment?appointmentId=${para['id'].toString()}'),
  //     headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${box.read('token')}'
  //     },
  //   );
  //   var data = jsonDecode(response.body.toString());
  //   debugPrint(data.toString());
  //   if (response.statusCode == 200) {
  //     return AppointmentConfirmationModel.fromJson(data);
  //   }

  //   throw {};
  // }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBarWidget(
        bottom: false,
        arrow_back: true,
        title: 'Appointment Confirmaiton',
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.appointmentDetail);
              },
              child: const Text('Done'))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: screen_padding,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: card_padding,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.check_circle_outline_sharp,
                              size: 50,
                              color: Colors.green.shade700,
                            ),
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.01,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                'Your in-person appointment\nhas been booked!',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.subtitle1?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade900,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Consumer<AppointmentConfirmationProvider>(
                    builder: (context, value, _) {
                  return FutureBuilder<AppointmentConfirmationModel>(
                    future: value
                        .baseAppointmentConfirmation(para['id'].toString()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text("got error ${snapshot.error}"));
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   width: double.infinity,
                            //   child: Card(
                            //     elevation: 0,
                            //     child: Padding(
                            //       padding: card_padding,
                            //       child: Column(
                            //         children: [
                            //           Text(
                            //               'Share your medical records with Assist.\nDr. ${snapshot.data?.appointmentDetails?.doctor?.firstName.toString()}',
                            //               textAlign: TextAlign.center,
                            //               style: theme.textTheme.subtitle2
                            //                   ?.copyWith(
                            //                       fontWeight: FontWeight.bold)),
                            //           SizedBox(
                            //             height: mediaQuery.height * 0.01,
                            //           ),
                            //           TextButton.icon(
                            //               style: ButtonStyle(
                            //                   backgroundColor:
                            //                       MaterialStateProperty.all(
                            //                           Colors.amber.shade600)),
                            //               onPressed: () {},
                            //               icon: const Icon(
                            //                 Icons.playlist_add_circle_rounded,
                            //                 color: Colors.white,
                            //               ),
                            //               label: const Text(
                            //                 'Add Medical Records',
                            //                 style: TextStyle(color: Colors.white),
                            //               ))
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                elevation: 0,
                                child: Padding(
                                  padding: card_padding,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Appointment Details',
                                          style: theme.textTheme.subtitle1),
                                      Timeline(
                                        indicators: const <Widget>[
                                          Icon(
                                              CupertinoIcons.person_alt_circle),
                                          Icon(CupertinoIcons.time),
                                          Icon(
                                              CupertinoIcons.person_alt_circle),
                                          Icon(Icons.money),
                                        ],
                                        children: <Widget>[
                                          listTile(
                                              'Patient Name',
                                              snapshot.data?.appointmentDetails
                                                      ?.patient?.firstName ??
                                                  '',
                                              null),
                                          listTile(
                                              'Appointment Time',
                                              '${snapshot.data?.appointmentDetails?.appointmentDate ?? ''}, ${snapshot.data?.appointmentDetails?.appointmentTime ?? ''}',
                                              null),
                                          listTile(
                                              'Doctor Name',
                                              '${snapshot.data?.appointmentDetails?.doctor?.firstName ?? ''} ${snapshot.data?.appointmentDetails?.doctor?.lastName ?? ''}',
                                              //at Surgimed Hospital
                                              null),
                                          listTile(
                                              'Appointment Fee',
                                              snapshot.data?.appointmentDetails
                                                      ?.fees ??
                                                  '',
                                              // 'Rs. 2300 (To be paid at Clinic)',
                                              null),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                elevation: 0,
                                child: Padding(
                                  padding: card_padding,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Diagnosis Details',
                                          style: theme.textTheme.subtitle1),
                                      Timeline(
                                        indicators: const <Widget>[
                                          Icon(Icons
                                              .medical_information_outlined),
                                        ],
                                        children: <Widget>[
                                          listTile(
                                              'Medicines Name',
                                              snapshot.data?.appointmentDetails
                                                      ?.diagnosis?.diagnosis ??
                                                  'N/A',
                                              null),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      // return Padding(
                      //   padding: screen_padding,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       SizedBox(
                      //         width: double.infinity,
                      //         child: Card(
                      //           color: Colors.grey.shade300,
                      //           elevation: 0,
                      //           child: Padding(
                      //             padding: card_padding,
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Align(
                      //                     alignment: Alignment.center,
                      //                     child: CircleAvatar(
                      //                       radius: 25,
                      //                       backgroundColor: Colors.grey.shade400,
                      //                     )),
                      //                 SizedBox(
                      //                   height: mediaQuery.height * 0.01,
                      //                 ),
                      //                 Align(
                      //                     alignment: Alignment.center,
                      //                     child: Column(
                      //                       children: [
                      //                         SizedBox(
                      //                           height: 40,
                      //                           width: 300,
                      //                           child: Card(
                      //                             elevation: 0,
                      //                             color: Colors.grey.shade400,
                      //                           ),
                      //                         ),
                      //                         SizedBox(
                      //                           height: 40,
                      //                           width: 180,
                      //                           child: Card(
                      //                             elevation: 0,
                      //                             color: Colors.grey.shade400,
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     )),
                      //                 SizedBox(
                      //                   height: mediaQuery.height * 0.05,
                      //                 ),
                      //                 SizedBox(
                      //                   height: 40,
                      //                   width: 220,
                      //                   child: Card(
                      //                     elevation: 0,
                      //                     color: Colors.grey.shade400,
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: mediaQuery.height * 0.02,
                      //                 ),
                      //                 ListTile(
                      //                   title: SizedBox(
                      //                     height: 25,
                      //                     child: Card(
                      //                       elevation: 0,
                      //                       color: Colors.grey.shade400,
                      //                     ),
                      //                   ),
                      //                   subtitle: SizedBox(
                      //                     height: 25,
                      //                     child: Card(
                      //                       elevation: 0,
                      //                       color: Colors.grey.shade400,
                      //                     ),
                      //                   ),
                      //                   leading: CircleAvatar(
                      //                     radius: 15,
                      //                     backgroundColor: Colors.grey.shade400,
                      //                   ),
                      //                 ),
                      //                 ListTile(
                      //                   title: SizedBox(
                      //                     height: 25,
                      //                     child: Card(
                      //                       elevation: 0,
                      //                       color: Colors.grey.shade400,
                      //                     ),
                      //                   ),
                      //                   subtitle: SizedBox(
                      //                     height: 25,
                      //                     child: Card(
                      //                       elevation: 0,
                      //                       color: Colors.grey.shade400,
                      //                     ),
                      //                   ),
                      //                   leading: CircleAvatar(
                      //                     radius: 15,
                      //                     backgroundColor: Colors.grey.shade400,
                      //                   ),
                      //                 ),
                      //                 ListTile(
                      //                   title: SizedBox(
                      //                     height: 25,
                      //                     child: Card(
                      //                       elevation: 0,
                      //                       color: Colors.grey.shade400,
                      //                     ),
                      //                   ),
                      //                   subtitle: SizedBox(
                      //                     height: 25,
                      //                     child: Card(
                      //                       elevation: 0,
                      //                       color: Colors.grey.shade400,
                      //                     ),
                      //                   ),
                      //                   leading: CircleAvatar(
                      //                     radius: 15,
                      //                     backgroundColor: Colors.grey.shade400,
                      //                   ),
                      //                 ),
                      //                 ListTile(
                      //                   title: SizedBox(
                      //                     height: 25,
                      //                     child: Card(
                      //                       elevation: 0,
                      //                       color: Colors.grey.shade400,
                      //                     ),
                      //                   ),
                      //                   subtitle: SizedBox(
                      //                     height: 25,
                      //                     child: Card(
                      //                       elevation: 0,
                      //                       color: Colors.grey.shade400,
                      //                     ),
                      //                   ),
                      //                   leading: CircleAvatar(
                      //                     radius: 15,
                      //                     backgroundColor: Colors.grey.shade400,
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // );
                    },
                  );
                }),
                // Container(
                //   width: double.infinity,
                //   height: mediaQuery.height * 0.12,
                //   decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //     begin: Alignment.topRight,
                //     end: Alignment.bottomLeft,
                //     colors: [
                //       Colors.deepPurple.shade900,
                //       Colors.blue.shade700,
                //     ],
                //   )),
                //   child: Padding(
                //     padding: card_padding,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text('Rs.200 OFF on ONLINE PAYMENT',
                //             style: theme.textTheme.subtitle2
                //                 ?.copyWith(color: Colors.white)),
                //         SizedBox(
                //           width: mediaQuery.width * 0.03,
                //         ),
                //         SizedBox(
                //           height: 50,
                //           width: 100,
                //           // width: mediaQuery.width * 0.25,
                //           child: TextButton(
                //               style: ButtonStyle(
                //                   shape: MaterialStateProperty.all<
                //                           RoundedRectangleBorder>(
                //                       RoundedRectangleBorder(
                //                           borderRadius:
                //                               BorderRadius.circular(5.0),
                //                           side: const BorderSide(
                //                               color: Colors.white))),
                //                   backgroundColor: MaterialStateProperty.all(
                //                       Colors.transparent)),
                //               onPressed: () {},
                //               child: Center(
                //                   child: Text('Pay Now',
                //                       style: theme.textTheme.subtitle2
                //                           ?.copyWith(color: Colors.white)))),
                //         )
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Timeline extends StatelessWidget {
  const Timeline({
    Key? key,
    required this.children,
    this.indicators,
    this.isLeftAligned = true,
    this.itemGap = 12.0,
    this.gutterSpacing = 4.0,
    this.padding = const EdgeInsets.all(8),
    this.controller,
    this.lineColor = Colors.grey,
    this.physics,
    this.shrinkWrap = true,
    this.primary = false,
    this.reverse = false,
    this.indicatorSize = 30.0,
    this.lineGap = 4.0,
    this.indicatorColor = Colors.blue,
    this.indicatorStyle = PaintingStyle.fill,
    this.strokeCap = StrokeCap.butt,
    this.strokeWidth = 2.0,
    this.style = PaintingStyle.stroke,
  })  : itemCount = children.length,
        assert(itemGap >= 0),
        assert(lineGap >= 0),
        assert(indicators == null || children.length == indicators.length),
        super(key: key);

  final List<Widget> children;
  final double itemGap;
  final double gutterSpacing;
  final List<Widget>? indicators;
  final bool isLeftAligned;
  final EdgeInsets padding;
  final ScrollController? controller;
  final int itemCount;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool primary;
  final bool reverse;

  final Color lineColor;
  final double lineGap;
  final double indicatorSize;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: (_, __) => SizedBox(height: itemGap),
      physics: physics,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      controller: controller,
      reverse: reverse,
      primary: primary,
      itemBuilder: (context, index) {
        final child = children[index];
        final _indicators = indicators;

        Widget? indicator;
        if (_indicators != null) {
          indicator = _indicators[index];
        }

        final isFirst = index == 0;
        final isLast = index == itemCount - 1;

        final timelineTile = <Widget>[
          CustomPaint(
            foregroundPainter: _TimelinePainter(
              hideDefaultIndicator: indicator != null,
              lineColor: lineColor,
              indicatorColor: indicatorColor,
              indicatorSize: indicatorSize,
              indicatorStyle: indicatorStyle,
              isFirst: isFirst,
              isLast: isLast,
              lineGap: lineGap,
              strokeCap: strokeCap,
              strokeWidth: strokeWidth,
              style: style,
              itemGap: itemGap,
            ),
            child: SizedBox(
              height: double.infinity,
              width: indicatorSize,
              child: indicator,
            ),
          ),
          SizedBox(width: gutterSpacing),
          Expanded(child: child),
        ];

        return IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                isLeftAligned ? timelineTile : timelineTile.reversed.toList(),
          ),
        );
      },
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    required this.hideDefaultIndicator,
    required this.indicatorColor,
    required this.indicatorStyle,
    required this.indicatorSize,
    required this.lineGap,
    required this.strokeCap,
    required this.strokeWidth,
    required this.style,
    required this.lineColor,
    required this.isFirst,
    required this.isLast,
    required this.itemGap,
  })  : linePaint = Paint()
          ..color = lineColor
          ..strokeCap = strokeCap
          ..strokeWidth = strokeWidth
          ..style = style,
        circlePaint = Paint()
          ..color = indicatorColor
          ..style = indicatorStyle;

  final bool hideDefaultIndicator;
  final Color indicatorColor;
  final PaintingStyle indicatorStyle;
  final double indicatorSize;
  final double lineGap;
  final StrokeCap strokeCap;
  final double strokeWidth;
  final PaintingStyle style;
  final Color lineColor;
  final Paint linePaint;
  final Paint circlePaint;
  final bool isFirst;
  final bool isLast;
  final double itemGap;

  @override
  void paint(Canvas canvas, Size size) {
    final indicatorRadius = indicatorSize / 2;
    final halfItemGap = itemGap / 2;
    final indicatorMargin = indicatorRadius + lineGap;

    final top = size.topLeft(Offset(indicatorRadius, 0.0 - halfItemGap));
    final centerTop = size.centerLeft(
      Offset(indicatorRadius, -indicatorMargin),
    );

    final bottom = size.bottomLeft(Offset(indicatorRadius, 0.0 + halfItemGap));
    final centerBottom = size.centerLeft(
      Offset(indicatorRadius, indicatorMargin),
    );

    if (!isFirst) canvas.drawLine(top, centerTop, linePaint);
    if (!isLast) canvas.drawLine(centerBottom, bottom, linePaint);

    if (!hideDefaultIndicator) {
      final Offset offsetCenter = size.centerLeft(Offset(indicatorRadius, 0));

      canvas.drawCircle(offsetCenter, indicatorRadius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
