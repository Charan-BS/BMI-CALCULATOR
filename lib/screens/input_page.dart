import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_status.dart';
import 'package:bmi_calculator/components/reusable_cards.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/my_own_widget.dart';
import 'package:bmi_calculator/bmi_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

int height = 120;
int weight = 20;
int age = 8;

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(color: kBackgroundColor),
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCards(
                        colour: selectedGender == Gender.male
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: const IconStatus(
                            icon: FontAwesomeIcons.person, text: 'MALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReusableCards(
                        colour: selectedGender == Gender.female
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild:const IconStatus(
                            icon: FontAwesomeIcons.personDress, text: 'FEMALE'),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCards(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kBoldTextStyle,
                          ),
                          const Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              const RoundSliderThumbShape(enabledThumbRadius: 12.00),
                          thumbColor: Colors.yellow,
                          overlayColor: const Color(0x1FFFFF00),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 250,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCards(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kBoldTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  btnOperation: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  btnOperation: () {
                                    setState(() {
                                      weight = weight + 1;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCards(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kBoldTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  btnOperation: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                RoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  btnOperation: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              BottomButton(
                buttonText: 'CALCULATE',
                onTap: () {
                  BmiBrain brain = BmiBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Results(
                        bmiInterpretation: brain.getInterpretation(),
                        bmiResult: brain.getBMI(),
                        bmiText: brain.getResultText(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
