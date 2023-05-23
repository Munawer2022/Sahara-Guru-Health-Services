import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/search_text_field_component.dart';

import '../../../../data/repositories/get_list_doctor_respository.dart';

class AllSpeciallzations extends StatefulWidget {
  const AllSpeciallzations({super.key});

  @override
  State<AllSpeciallzations> createState() => _AllSpeciallzationsState();
}

class _AllSpeciallzationsState extends State<AllSpeciallzations> {
  TextEditingController searchTermController = TextEditingController();

  final box = GetStorage();
  List<dynamic> getsearchdoctorlist = [];
  void getsearchdoctor() async {
    Response response = await get(
      Uri.parse(
          'https://saharadigitalhealth.in/sahara_digital_health/public/api/search/department/doctors?searchTerm=${searchTermController.text}'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        getsearchdoctorlist = jsonDecode(response.body.toString());
      });
    } else {
      throw Exception('failed');
    }
  }

  @override
  void initState() {
    super.initState();
    searchTermController.addListener(() {
      getsearchdoctor();
    });
  }

  GetListDoctorRespository demoRespository = GetListDoctorRespository();
  bool _isShow = true;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    debugPrint('object');
    return Scaffold(
      appBar: const MyAppBarWidget(
        arrow_back: true,
        title: 'Find a Doctor',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: card_padding,
                child: SearchTextFieldComponent(
                    controller: searchTermController,
                    text:
                        'Doctors, hospitals, specialties, services, diseases'),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Padding(
                //   padding: screen_padding,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text('Recent searches', style: theme.textTheme.subtitle2),
                //       TextButton(
                //           onPressed: () {},
                //           child: const Text(
                //             'Clear all',
                //           ))
                //     ],
                //   ),
                // ),
                // SlideHorizontalList(),
                // SizedBox(
                //   height: mediaQuery.height * 0.02,
                // ),
                // Padding(
                //   padding: screen_padding,
                //   child: Text('Search by specialty',
                //       style: theme.textTheme.subtitle2),
                // ),
                // FutureBuilder<Getlistdoctor>(
                //     future: demoRespository.getlistdoctor(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return GridView.builder(
                //           physics: const NeverScrollableScrollPhysics(),
                //           shrinkWrap: true,
                //           gridDelegate:
                //               const SliverGridDelegateWithFixedCrossAxisCount(
                //                   childAspectRatio: 2.8, crossAxisCount: 2),
                //           itemBuilder: (_, index) {
                //             return Card(
                //               elevation: 0,
                //               child: Center(
                //                 child: ListTile(
                //                   // onTap: () {},
                //                   title: Text(
                //                       snapshot.data!.departments![index].name
                //                           .toString(),
                //                       style: theme.textTheme.subtitle2),
                //                   leading: const CircleAvatar(),
                //                 ),
                //               ),
                //             );
                //           },
                //           itemCount: snapshot.data!.departments!.length,
                //         );
                //       }
                //       return Container();
                //     }),
                searchTermController.text.isEmpty
                    ? Visibility(
                        visible: _isShow,
                        child: const Center(child: Text('no search')))
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: getsearchdoctorlist.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // InkWell(
                              //   onTap: () {
                              //     status = placesList[index]['description'];
                              //     _willPopCallback();
                              //   },
                              //   child:
                              ListTile(
                                onTap: () {},
                                title: Text(getsearchdoctorlist[index]['name']
                                    .toString()),
                              ),
                              const Divider()
                            ],
                          );
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}