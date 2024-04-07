import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconStatus extends StatelessWidget {
  const IconStatus({super.key,required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70.00,
        ),
        const SizedBox(
          height: 10
        ),
        Text(text, style: kLabelTextStyle)
      ],
    );
  }
}
