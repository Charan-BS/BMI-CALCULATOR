import 'dart:math';

class BmiBrain {
  // int myWeight = 0;
  // int myHeight = 0;
  // BmiBrain(int height, int weight) {
  //   myHeight = height;
  //   myWeight = weight;
  // }
  //Below code is the shorter version of above code
  final int height;
  final int weight;

  BmiBrain({required this.height, required this.weight});
  double _bmi = 0.00;

  String getBMI() {
    _bmi = 0.00;
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight, Good job';
    } else {
      return 'You have a lower than body weight. You can eat a bit more';
    }
  }
}
