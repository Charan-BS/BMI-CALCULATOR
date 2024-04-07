import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_cards.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class Results extends StatelessWidget {
  const Results(
      {required this.bmiText,
      required this.bmiResult,
      required this.bmiInterpretation,super.key});

  final String bmiText;
  final String bmiResult;
  final String bmiInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(9.0),
                child: Text(
                  'Your Result',
                  style: kResultLableTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: ReusableCards(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      bmiText,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMIResultTextStyle,
                    ),
                    Text(
                      bmiInterpretation,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: BottomButton(
                buttonText: 'RECALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ));
  }
}
