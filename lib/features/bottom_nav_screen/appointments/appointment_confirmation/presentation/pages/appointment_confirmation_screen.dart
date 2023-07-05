import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../../core/utils/constants/colors.dart';
import '../../../../../../core/utils/constants/padding.dart';
import '../../../../../../core/utils/resources/components/app_bar.dart';

import '../provider/appointment_confirmation_provider.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../widgets/list_tile.dart';

class AppointmentConfirmationScreen extends StatelessWidget {
  dynamic para;
  AppointmentConfirmationScreen({super.key, required this.para});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.textButtonColor,
          leading: arrow(context),
          title: text(context, 'Appointment Confirmaiton')),
      // MyAppBarWidget(
      //   arrow_back: true,
      //   title: 'Appointment Confirmaiton',
      //   actions: [
      //     TextButton(
      //         onPressed: () {
      //           Navigator.pushNamed(context, RoutesName.appointmentDetail);
      //         },
      //         child: const Text('Done'))
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: screen_padding,
            child: Column(
              children: [
                Consumer<AppointmentConfirmationProvider>(
                    builder: (context, value, _) {
                  return FutureBuilder(
                    future: value
                        .baseAppointmentConfirmation(para['id'].toString()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                color: Colors.grey.shade300,
                                elevation: 0,
                                child: Padding(
                                  padding: card_padding,
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade400,
                                          )),
                                      SizedBox(
                                        height: mediaQuery.height * 0.01,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 30,
                                          width: 250,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade400,
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                color: Colors.grey.shade300,
                                elevation: 0,
                                child: Padding(
                                  padding: card_padding,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                      Timeline(
                                        indicators: <Widget>[
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade400,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade400,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade400,
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade400,
                                          ),
                                        ],
                                        children: <Widget>[
                                          ListTile(
                                            title: Container(
                                              height: 20,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                          ),
                                          ListTile(
                                            title: Container(
                                              height: 20,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                          ),
                                          ListTile(
                                            title: Container(
                                              height: 20,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                          ),
                                          ListTile(
                                            title: Container(
                                              height: 20,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                          ),
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
                                color: Colors.grey.shade300,
                                elevation: 0,
                                child: Padding(
                                  padding: card_padding,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                      ),
                                      Timeline(
                                        indicators: <Widget>[
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.shade400,
                                          ),
                                        ],
                                        children: <Widget>[
                                          ListTile(
                                            title: Container(
                                              height: 20,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                            style: theme.textTheme.subtitle1
                                                ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green.shade900,
                                            )),
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
                                      Text('Appointment Details',
                                          style: theme.textTheme.subtitle1),
                                      Timeline(
                                        indicators: const <Widget>[
                                          Icon(
                                              CupertinoIcons.person_alt_circle),
                                          Icon(CupertinoIcons.time),
                                          Icon(
                                              CupertinoIcons.person_alt_circle),
                                          Icon(Icons.price_change_outlined),
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
                    },
                  );
                }),
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
