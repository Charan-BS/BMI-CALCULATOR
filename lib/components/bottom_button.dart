import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key,required this.buttonText, required this.onTap});
  final String buttonText;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: kBottomContainerColor,
        height: 60,
        margin: const EdgeInsets.only(top: 5.00),
        child: Text(
          buttonText,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}