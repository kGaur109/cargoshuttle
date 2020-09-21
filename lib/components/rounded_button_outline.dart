import 'package:cargoshuttle/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class RoundButton_outline extends StatelessWidget {
  RoundButton_outline({this.text, @required this.onPressed, this.color});

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
            minWidth: 272.0,
            height: 41.0,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: (color == themeColor) ? Colors.white : Colors.black,

              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: themeColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(6, 5),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
