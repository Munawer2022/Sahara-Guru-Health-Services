import 'package:flutter/material.dart';

import 'package:sahara_guru_health_services/core/utils/constants/images.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

class AppointmentDetail extends StatefulWidget {
  const AppointmentDetail({super.key});

  @override
  State<AppointmentDetail> createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  List<String> list = <String>['Rs. 2300 Remaining'];
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: const MyAppBarWidget(
        arrow_back: true,
        title: 'Appointment Detail',
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
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 25,
                        ),
                        title: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Card(
                                elevation: 0,
                                color: theme.scaffoldBackgroundColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Your Appointment is in ',
                                      style:
                                          theme.textTheme.subtitle2?.copyWith(),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '2h, 2m',
                                            style: theme.textTheme.subtitle2
                                                ?.copyWith(
                                                    color: Colors.blue.shade800,
                                                    fontWeight:
                                                        FontWeight.w900))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text('Assist. Prof. Dr. Sana Younas',
                                style: theme.textTheme.subtitle2?.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('M.B.B.S., F.C.P.S.\nDermatologist',
                                style: theme.textTheme.subtitle2
                                    ?.copyWith(color: Colors.black54)),
                            SizedBox(
                              height: mediaQuery.height * 0.01,
                            ),
                            Container(
                              height: 25,
                              width: 70,
                              color: theme.scaffoldBackgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.thumb_up_alt,
                                        color: Colors.green,
                                        size: 18,
                                      ),
                                      Text('97%',
                                          style: theme.textTheme.subtitle2
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz_outlined),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
                      Card(
                        color: theme.scaffoldBackgroundColor,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Payment Detail:',
                                  style: theme.textTheme.subtitle2
                                      ?.copyWith(color: Colors.black54)),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(12),
                                  value: list.first,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.white),
                                  onChanged: (String? value) {
                                    setState(() {
                                      list.first = value!;
                                    });
                                  },
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Card(
                                          color: Colors.orange,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(value,
                                                style: theme.textTheme.subtitle2
                                                    ?.copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          )),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text("Patient's Name",
                            style: theme.textTheme.subtitle2
                                ?.copyWith(color: Colors.black54)),
                        subtitle: Text('Assed',
                            style: theme.textTheme.subtitle2
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        title: Text("Appointment time",
                            style: theme.textTheme.subtitle2
                                ?.copyWith(color: Colors.black54)),
                        subtitle: Text('2023-05-04 19:40:00',
                            style: theme.textTheme.subtitle2
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        title: Text("Location",
                            style: theme.textTheme.subtitle2
                                ?.copyWith(color: Colors.black54)),
                        subtitle: Text('Surgimed Hospital',
                            style: theme.textTheme.subtitle2
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                          title: Text("1 - Zafar Ali Road, Gulberg 5, Lahore",
                              style: theme.textTheme.subtitle2
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          subtitle: TextButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      theme.scaffoldBackgroundColor)),
                              onPressed: () {},
                              icon: Image.asset(
                                google_maps_icon,
                                scale: 28,
                              ),
                              label: Text('See on map',
                                  style: theme.textTheme.subtitle2?.copyWith(
                                      fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 0,
                child: Padding(
                  padding: card_padding,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Add Medical Record',
                            style: theme.textTheme.subtitle2
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        trailing: TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All',
                            )),
                        subtitle: Text(
                            'Save your medical records so wont lose them anymore',
                            style: theme.textTheme.subtitle2
                                ?.copyWith(color: Colors.black54)),
                      ),
                      Image.asset(
                        medical_record,
                        scale: 8,
                      ),
                      TextButton.icon(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.amber.shade600)),
                          onPressed: () {},
                          icon: Icon(
                            Icons.playlist_add_circle_rounded,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Add Medical Records',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
