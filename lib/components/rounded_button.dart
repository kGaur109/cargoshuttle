import 'package:cargoshuttle/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.text, @required this.onPressed, this.color});

  final String text;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        child: Material(
          elevation: 5.0,
          color: color,
          borderRadius: BorderRadius.circular(10.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
                color: (color == themeColor) ? Colors.white : themeColor,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: themeColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.7),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(6, 5),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
