import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../pages/bottom_nav_screen/home_screen/skin_specialists/book_appointment/get_list_doctor_model.dart';

class SlideHorizontalList extends StatefulWidget {
  final ontap;
  const SlideHorizontalList({super.key, this.ontap});

  @override
  State<SlideHorizontalList> createState() => _SlideHorizontalListState();
}

class _SlideHorizontalListState extends State<SlideHorizontalList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlistdoctor();
  }

  final box = GetStorage();

  Future<Getlistdoctor> getlistdoctor() async {
    try {
      Response response = await get(
        Uri.parse(
            'https://saharadigitalhealth.in/sahara_digital_health/public/api/department/doctors/list'),
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
      } else {
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
    return FutureBuilder<Getlistdoctor>(
        future: getlistdoctor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: double.infinity,
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.departments!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: InkWell(
                    onTap: widget.ontap,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        SizedBox(
                          height: mediaQuery.height * 0.01,
                        ),
                        Text(snapshot.data!.departments![index].name.toString(),
                            style: theme.textTheme.subtitle2),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }
}
