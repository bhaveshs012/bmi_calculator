import 'dart:math';

class Calculator {
  Calculator({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return 'Your BMI is slightly higher than Normal. Try to exercise more!! ';
    } else if (_bmi >= 18.5) {
      return 'Your BMI is perfectly normal. Good Job !';
    } else {
      return 'Your BMI is slightly lower than Normal. Try to eat more!! ';
    }
  }
}
