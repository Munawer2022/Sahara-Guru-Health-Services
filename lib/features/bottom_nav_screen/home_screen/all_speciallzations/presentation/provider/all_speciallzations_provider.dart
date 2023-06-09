import 'package:flutter/material.dart';

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
