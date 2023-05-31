import 'package:flutter/material.dart';

class AppointmentController extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  int _value1 = 0;
  int get value1 => _value1;

  changeTabIndex(int index) {
    _value = index;
    notifyListeners();
  }

  changeTabIndex1(int index) {
    _value1 = index;
    notifyListeners();
  }
}
