import 'package:flutter/material.dart';

class BookAppointmentController extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  changeTabIndex(
    dynamic index,
  ) {
    _value = index;
    notifyListeners();
  }
}
