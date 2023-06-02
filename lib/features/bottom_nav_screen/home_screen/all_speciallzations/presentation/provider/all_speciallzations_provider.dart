import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sahara_guru_health_services/features/bottom_nav_screen/home_screen/search_doctor/data/repositories/search_doctor_respository.dart';

import '../../data/models/all_speciallzations_model.dart';
import '../../data/repositories/all_speciallzations_repository.dart';

class AllSpeciallzationsProvider extends ChangeNotifier {
  AllSpeciallzationsRespository allSpeciallzationsRespository =
      AllSpeciallzationsRespository();

  Future<AllSpeciallzationsModel> baseAllSpeciallzations() async {
    return await allSpeciallzationsRespository.baseAllSpeciallzations();
    // notifyListeners();
  }
}
