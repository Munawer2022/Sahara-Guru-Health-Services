import 'package:flutter/material.dart';

class BookAppointmentController extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  int _value1 = 0;
  int get value1 => _value1;

  int _value2 = 0;
  int get value2 => _value2;

  changeTabIndex(int index) {
    _value = index;
    notifyListeners();
  }

  changeTabIndex1(int index) {
    _value1 = index;
    notifyListeners();
  }

  changeTabIndex2(int index) {
    _value2 = index;
    notifyListeners();
  }
}
