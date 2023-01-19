import 'dart:math';

import 'package:flutter/cupertino.dart';

class BmiChangeNotifierController extends ChangeNotifier {
  var bmi = 0.0;

  Future<void> calc({required double weight, required double height}) async {
    bmi = 0.0;
    await Future.delayed(const Duration(seconds: 1));
    bmi = weight / pow(height, 2);
    notifyListeners();
  }
}
