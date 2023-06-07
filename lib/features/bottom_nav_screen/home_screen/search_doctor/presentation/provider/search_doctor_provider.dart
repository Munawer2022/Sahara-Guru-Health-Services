import 'package:flutter/material.dart';

import '../../data/repositories/search_doctor_respository.dart';

class SearchDoctorProvider extends ChangeNotifier {
  SearchDoctorRepository searchDoctorRepository = SearchDoctorRepository();

  List<dynamic> get searchDoctorList => _searchDoctorList;
  List<dynamic> _searchDoctorList = [];

  dynamic baseSearchDoctor(searchController) async {
    return _searchDoctorList =
        await searchDoctorRepository.baseSearchDoctor(searchController);
  }
}
