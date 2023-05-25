import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../../../../data/repositories/list_doctor_respository.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({super.key});

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
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
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        getsearchdoctorlist = jsonDecode(response.body.toString());
      });
    } else {
      Exception('failed');
    }
  }

  @override
  void initState() {
    super.initState();
    searchTermController.addListener(() {
      getsearchdoctor();
    });
  }

  ListDoctorRespository demoRespository = ListDoctorRespository();
  bool _isShow = true;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    debugPrint('object');
    return Scaffold(
      appBar: MyAppBarWidget(
        readOnly: false,
        controller: searchTermController,
        bottom: true,
        bottomText: 'Doctors, hospitals, specialties, services, diseases',
        arrow_back: true,
        title: 'Find a Doctor',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                              ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.bookappointment,
                                      arguments: {
                                        'id': getsearchdoctorlist[index]['id'],
                                        'fees': getsearchdoctorlist[index]
                                            ['fees'],
                                        'bio': getsearchdoctorlist[index]
                                                ['bio'] ??
                                            'N/A',
                                        'profile': getsearchdoctorlist[index]
                                            ['profile'],
                                        'firstName': getsearchdoctorlist[index]
                                            ['first_name'],
                                        'lastName': getsearchdoctorlist[index]
                                            ['last_name']
                                      });
                                },
                                title: Text(getsearchdoctorlist[index]
                                        ['first_name']
                                    .toString()),
                              ),
                              const Divider()
                            ],
                          );
                        }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
