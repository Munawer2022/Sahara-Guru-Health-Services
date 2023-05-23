import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/utils/constants/padding.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/core/utils/resources/components/search_text_field_component.dart';
import 'package:sahara_guru_health_services/features/presentation/pages/bottom_nav_screen/home_screen/skin_specialists/book_appointment/get_list_doctor_model.dart';

import '../../../../../config/routes/routes_names.dart';
import '../../../../../core/utils/constants/app_url.dart';
import '../../../../data/repositories/get_list_doctor_respository.dart';
import '../../../widgets/slide_horizontal_list.dart';

class AllSpeciallzations extends StatefulWidget {
  AllSpeciallzations({super.key});

  @override
  State<AllSpeciallzations> createState() => _AllSpeciallzationsState();
}

class _AllSpeciallzationsState extends State<AllSpeciallzations> {
  TextEditingController searchTermController = TextEditingController();

  final box = GetStorage();
  List<dynamic> getsearchdoctorlist = [];
  // Future<List<SearchDoctor>>
  void getsearchdoctor() async {
    Response response = await get(
      Uri.parse(
          'https://saharadigitalhealth.in/sahara_digital_health/public/api/search/department/doctors?searchTerm=' +
              searchTermController.text),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
        // "searchTerm": searchTermController.text,
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      setState(() {
        getsearchdoctorlist = jsonDecode(response.body.toString());
        // ['predictions'];
      });
      // var data = jsonDecode(response.body.toString());

      // for (Map i in data) {
      //   // print(i['name']);
      //   getsearchdoctorlist.add(SearchDoctor.fromJson(i));
      // }
      // return getsearchdoctorlist;
    } else {
      throw Exception('failed');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
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
                        child: Center(child: Text('no search')))
                    : Container(
                        child: ListView.builder(
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
                                  title: Text(getsearchdoctorlist[index]['name']
                                      .toString()),
                                ),
                                Divider()
                              ],
                            );
                          },
                        ),
                      ),
              ],
            ),

            // FutureBuilder(
            //     future: getsearchdoctor(),
            //     builder: (context, AsyncSnapshot<List<SearchDoctor>> snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(child: CircularProgressIndicator());
            //       } else {
            //         if (searchTermController.text.isEmpty) {
            //           return Column(
            //             mainAxisSize: MainAxisSize.min,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: [
            //               Padding(
            //                 padding: screen_padding,
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text('Recent searches',
            //                         style: theme.textTheme.subtitle2),
            //                     TextButton(
            //                         onPressed: () {},
            //                         child: const Text(
            //                           'Clear all',
            //                         ))
            //                   ],
            //                 ),
            //               ),
            //               SlideHorizontalList(),
            //               SizedBox(
            //                 height: mediaQuery.height * 0.02,
            //               ),
            //               Padding(
            //                 padding: screen_padding,
            //                 child: Text('Search by specialty',
            //                     style: theme.textTheme.subtitle2),
            //               ),
            //               FutureBuilder<Getlistdoctor>(
            //                   future: getlistdoctor(),
            //                   builder: (context, snapshot) {
            //                     if (snapshot.hasData) {
            //                       return GridView.builder(
            //                         physics:
            //                             const NeverScrollableScrollPhysics(),
            //                         shrinkWrap: true,
            //                         gridDelegate:
            //                             const SliverGridDelegateWithFixedCrossAxisCount(
            //                                 childAspectRatio: 2.8,
            //                                 crossAxisCount: 2),
            //                         itemBuilder: (_, index) {
            //                           name = snapshot
            //                               .data!.departments![index].name
            //                               .toString();
            //                           return Card(
            //                             elevation: 0,
            //                             child: Center(
            //                               child: ListTile(
            //                                 // onTap: () {},
            //                                 title: Text(
            //                                     snapshot.data!
            //                                         .departments![index].name
            //                                         .toString(),
            //                                     style:
            //                                         theme.textTheme.subtitle2),
            //                                 leading: const CircleAvatar(),
            //                               ),
            //                             ),
            //                           );
            //                         },
            //                         itemCount:
            //                             snapshot.data!.departments!.length,
            //                       );
            //                     }
            //                     return Container();
            //                   })
            //             ],
            //           );
            //         } else if (name!
            //             .toLowerCase()
            //             .contains(searchTermController.text.toLowerCase())) {
            //           return ListView.builder(
            //               itemCount: snapshot.data?.length,
            //               itemBuilder: (context, index) {
            //                 return Text(snapshot.data![index].name.toString());
            //               });
            //         }
            //       }
            //       return Container();
            //     }),
          ],
        ),
      ),
    );
  }
}

class SearchDoctor {
  String? name;
  String? departmentName;

  SearchDoctor({this.name, this.departmentName});

  SearchDoctor.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    departmentName = json['departmentName'];
  }
}
