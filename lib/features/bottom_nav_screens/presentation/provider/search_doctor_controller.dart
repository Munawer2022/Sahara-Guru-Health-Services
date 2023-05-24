import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/utils/utils.dart';

import 'package:sahara_guru_health_services/features/bottom_nav_screens/data/repositories/search_doctor_respository.dart';

// class SearchDoctorController extends ChangeNotifier {
//   List<dynamic> get searchDoctorList => _searchDoctorList;
//   List<dynamic> _searchDoctorList = [];
//   SearchDoctorRespository searchDoctorRespository = SearchDoctorRespository();

//   Future<void> searchDoctor(context, url) async {
//     _searchDoctorList = await searchDoctorRespository
//         .getsearchdoctor(url)
//         .onError((error, stackTrace) {
//       Utils().errorSnackBarMessage(error.toString(), context);
//     });
//     notifyListeners();
//   }
// }
class SearchDoctorController extends ChangeNotifier {
  final box = GetStorage();
  List<dynamic> get searchDoctorList => _searchDoctorList;
  List<dynamic> _searchDoctorList = [];

  void getSearchDoctor(url) async {
    Response response = await get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      },
    );

    if (response.statusCode == 200) {
      _searchDoctorList = jsonDecode(response.body.toString());
      notifyListeners();
    } else {
      throw Exception('Failed to fetch search doctors.');
    }
  }
}
