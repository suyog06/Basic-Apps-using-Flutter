import 'package:flutter/material.dart';

import 'constants.dart';
class ReusableChild extends StatelessWidget {
  final IconData changeIcon;
  final String changeText;

  ReusableChild({this.changeIcon,this.changeText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          changeIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          changeText,
          style: kLabelTextStyle,
          ),
      ],
    );
  }
}