import 'dart:async';
import 'dart:math';

import 'package:bmi_calculator/bmi_bloc_pattern/bmi_state.dart';

class BmiBlocPatternController {
  final _bmiStreamController = StreamController<BmiState>.broadcast()
    ..add(BmiState(bmi: 0.0));

  Stream<BmiState> get bmiOut => _bmiStreamController.stream;

  void dispose() {
    _bmiStreamController.close();
  }

  Future<void> calc({required double weight, required double height}) async {
    _bmiStreamController.add(BmiStateLoading());
    await Future.delayed(const Duration(seconds: 1));
    _bmiStreamController.add(BmiState(bmi: weight / pow(height, 2)));
  }
}
