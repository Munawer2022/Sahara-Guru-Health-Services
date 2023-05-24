import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../../../../core/utils/constants/app_url.dart';
import '../../presentation/pages/bottom_nav_screen/home_screen/skin_specialists/book_appointment/get_list_doctor_model.dart';

class ListDoctorRespository {
  final box = GetStorage();

  Future<Getlistdoctor> getlistdoctor() async {
    var url = Uri.parse(AppUrl.listDoctors);
    var response = await get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      },
    );
    var data = jsonDecode(response.body.toString());
    return Getlistdoctor.fromJson(data);
  }
}
