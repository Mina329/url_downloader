import 'package:flutter/material.dart';
import '/constants.dart';

class CardButtons extends StatelessWidget {
  CardButtons({required this.labeltext ,required this.onpress });
  final String labeltext ;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        height: 120.0,
        width: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              labeltext,
              style: kTextStyle,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.cyanAccent.shade100,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: onpress,
    );
  }
}
