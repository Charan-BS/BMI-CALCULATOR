import 'package:flutter/material.dart';

class ReusableCards extends StatelessWidget {
  const ReusableCards({super.key, required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget? cardChild;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.00),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15.00),
        ),
        child: cardChild,
      ),
    );
  }
}
