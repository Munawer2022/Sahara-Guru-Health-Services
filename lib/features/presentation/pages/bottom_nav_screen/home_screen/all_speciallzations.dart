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
import '../../../widgets/slide_horizontal_list.dart';

class AllSpeciallzations extends StatelessWidget {
  AllSpeciallzations({super.key});
  TextEditingController searchTermController = TextEditingController();
  final box = GetStorage();

  Future getsearchdoctor() async {
    try {
      var data;
      Response response = await get(
        Uri.parse(
            'https://saharadigitalhealth.in/sahara_digital_health/public/api/search/department/doctors'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
          "searchTerm": searchTermController.text,
        },
      );

      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        if (kDebugMode) {
          print(data);
        }

        return data;
      } else {
        throw Exception('Error');
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
            FutureBuilder(
                future: getsearchdoctor(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (searchTermController.text.isEmpty) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: screen_padding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Recent searches',
                                    style: theme.textTheme.subtitle2),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Clear all',
                                    ))
                              ],
                            ),
                          ),
                          SlideHorizontalList(
                            text: 'Skin Specialist',
                            ontap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.skinspecialists);
                            },
                          ),
                          SizedBox(
                            height: mediaQuery.height * 0.02,
                          ),
                          Padding(
                            padding: screen_padding,
                            child: Text('Search by specialty',
                                style: theme.textTheme.subtitle2),
                          ),
                          Padding(
                            padding: screen_padding,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 2.5, crossAxisCount: 2),
                              itemBuilder: (_, index) => Card(
                                elevation: 0,
                                child: Center(
                                  child: ListTile(
                                    title: Text('Urologist',
                                        style: theme.textTheme.subtitle2),
                                    leading: const CircleAvatar(),
                                  ),
                                ),
                              ),
                              itemCount: 20,
                            ),
                          )
                        ],
                      );
                    } else if (searchTermController.text.isNotEmpty) {
                      return SizedBox(
                          height: mediaQuery.height * 0.01,
                          width: double.infinity,
                          child: Card(
                              child: Center(
                                  child: Text(snapshot.data.toString()))));
                    } else {
                      return Container();
                    }
                  } else {
                    return const Center(child: Text('loading'));
                  }
                }),
          ],
        ),
      ),
    );
  }
}
