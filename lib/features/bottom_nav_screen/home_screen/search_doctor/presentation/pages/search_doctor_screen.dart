import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:sahara_guru_health_services/core/utils/resources/components/app_bar.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/search_doctor/presentation/provider/search_doctor_provider.dart';

import '../../../../../../config/routes/routes_names.dart';
import '../../../../../../core/utils/constants/images.dart';
import '../../../../../data/repositories/list_doctor_respository.dart';

class SearchDoctorScreen extends StatefulWidget {
  const SearchDoctorScreen({super.key});

  @override
  State<SearchDoctorScreen> createState() => _SearchDoctorScreenState();
}

class _SearchDoctorScreenState extends State<SearchDoctorScreen> {
  TextEditingController searchTermController = TextEditingController();
  // SearchDoctorProvider searchDoctorProvider = SearchDoctorProvider();

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
      // searchDoctorProvider.baseSearchDoctor(searchTermController.text);
      getsearchdoctor();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchTermController.dispose();
  }

  // ListDoctorRespository demoRespository = ListDoctorRespository();
  final bool _isShow = true;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    debugPrint('object');
    return Scaffold(
      appBar: MyAppBarWidget(
        suffixIcon: searchTermController.text.isEmpty
            ? null
            : IconButton(
                onPressed: searchTermController.clear,
                icon: const Icon(CupertinoIcons.clear_circled_solid),
              ),
        readOnly: false,
        controller: searchTermController,
        bottom: true,
        bottomText: 'Doctors, hospitals, specialties, services, diseases',
        arrow_back: false,
        title: 'Find a Doctor',
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                CupertinoIcons.clear,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: searchTermController.text.isEmpty
            ? Visibility(
                visible: _isShow,
                child: Column(
                  children: [
                    Image.asset(
                      search,
                      scale: 6,
                    ),
                    ListTile(
                        title: Center(
                          child: Text('What Are You\nSearching For?',
                              textAlign: TextAlign.start,
                              style: theme.textTheme.headline6),
                        ),
                        subtitle: const Center(
                          child: Text(
                            "\nHere You Find Your Favorite Doctor's",
                          ),
                        )),
                  ],
                ))
            : getsearchdoctorlist.isEmpty
                ? Column(
                    children: [
                      Image.asset(
                        no_data,
                        scale: 6,
                      ),
                      ListTile(
                          title: Center(
                            child: Text(
                                'Result Not Found\n"${searchTermController.text.toString()}"',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headline6),
                          ),
                          subtitle: const Center(
                            child: Text(
                              "\nSorry, we couldn't find any matches",
                            ),
                          )),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Text('Doctors', style: theme.textTheme.subtitle1),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: getsearchdoctorlist.length,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: mediaQuery.height * 0.10,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Center(
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RoutesName.bookappointment,
                                            arguments: {
                                              'id': getsearchdoctorlist[index]
                                                  ['id'],
                                              'fees': getsearchdoctorlist[index]
                                                  ['fees'],
                                              'bio': getsearchdoctorlist[index]
                                                      ['bio'] ??
                                                  'N/A',
                                              'profile':
                                                  getsearchdoctorlist[index]
                                                      ['profile'],
                                              'firstName':
                                                  getsearchdoctorlist[index]
                                                      ['first_name'],
                                              'lastName':
                                                  getsearchdoctorlist[index]
                                                      ['last_name']
                                            });
                                      },
                                      title: Text(
                                          '${getsearchdoctorlist[index]['first_name'].toString()} ${getsearchdoctorlist[index]['last_name'].toString()}'),
                                      subtitle: Text(getsearchdoctorlist[index]
                                              ['departmentName']
                                          .toString()),
                                      leading: DecoratedBox(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(.2),
                                                blurRadius: 10,
                                              )
                                            ]),

                                        // backgroundColor: Colors.white,
                                        // radius: 27,
                                        child: getsearchdoctorlist[index]
                                                    ['profile'] !=
                                                null
                                            ? CircleAvatar(
                                                backgroundColor: Colors.white,
                                                onBackgroundImageError:
                                                    (exception, stackTrace) {},
                                                backgroundImage: NetworkImage(
                                                    department_doctors_profiles +
                                                        getsearchdoctorlist[
                                                                    index]
                                                                ['profile']
                                                            .toString()),
                                                radius: 25,
                                              )
                                            : const CircleAvatar(
                                                radius: 25,
                                                backgroundColor: Colors.white,
                                                child: Center(
                                                    child: Icon(
                                                  CupertinoIcons.person_alt,
                                                  size: 40,
                                                  color: Colors.grey,
                                                )),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: mediaQuery.height * 0.01,
                                )
                              ],
                            );
                          })
                    ],
                  ),
      ),
    );
  }
}
