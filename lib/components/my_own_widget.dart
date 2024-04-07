import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.icon, required this.btnOperation});

  final IconData icon;
  final Function() btnOperation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: btnOperation,
      elevation: 0.00,
      //copied from FloatingActionButton SourceCode
      constraints:const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape:const CircleBorder(),
      fillColor: Colors.white,
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
