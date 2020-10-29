import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  final Color col;
  final Widget cardChild;
  final Function onPress;
  ReusableContainer({@required this.col, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: col,
        ),
      ),
    );
  }
}