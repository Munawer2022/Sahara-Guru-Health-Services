import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:sahara_guru_health_services/core/utils/constants/app_url.dart';

import '../../data/models/get_list_doctor_model.dart';

class CatagoryDoctorProvider {
  final box = GetStorage();

  Future<Getlistdoctor> getlistdoctor(id) async {
    Response response = await get(
      Uri.parse(AppUrl.listDoctors + id),
      // 'https://saharadigitalhealth.in/sahara_digital_health/public/api/department/doctors/list?departmentId=${widget.data['department_id'].toString()}'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      },
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Getlistdoctor.fromJson(data);
    }

    throw {};
  }
}
