import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colorValue, this.cardChild, this.onPress});
  final Color colorValue;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.fromLTRB(15.0, 15.0, 7.5, 7.5),
        decoration: BoxDecoration(
            color: colorValue,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}