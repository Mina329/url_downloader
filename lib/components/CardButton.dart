import 'package:flutter/material.dart';
import '/constants.dart';

class CardButtons extends StatelessWidget {
  CardButtons({required this.labeltext ,required this.onpress,required this.height,required this.width });
  final String labeltext ;
  final VoidCallback onpress;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        height: height,
        width: width,
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
          color:  Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: onpress,
    );
  }
}
