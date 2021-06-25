import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
                fontFamily: 'Monospace',
                color: Colors.white,
                fontSize: 20.0),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        width: MediaQuery
            .of(context)
            .size
            .width * 0.50,
        height: MediaQuery
            .of(context)
            .size
            .width * 0.155,
        decoration: BoxDecoration(
            color: Color(0xFFEB1555),
            borderRadius: BorderRadius.circular(50.0)
        ),
      ),
    );
  }
}
