import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/search_doctor/data/repositories/search_doctor_respository.dart';

class SearchDoctorProvider extends ChangeNotifier {
  SearchDoctorRepository searchDoctorRepository = SearchDoctorRepository();
  final box = GetStorage();
  List<dynamic> get searchDoctorList => _searchDoctorList;
  List<dynamic> _searchDoctorList = [];

  dynamic baseSearchDoctor(String searchController) async {
    _searchDoctorList =
        await searchDoctorRepository.baseSearchDoctor(searchController);
    notifyListeners();
  }
}
