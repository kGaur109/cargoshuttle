import 'package:cargoshuttle/components/rounded_button.dart';
import 'package:cargoshuttle/components/rounded_button_outline.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:flutter/material.dart';

class AddMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: themeColor,
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundButton(
                text: "Add Load Post",
                onPressed: () {},
                color: themeColor,
              ),
              RoundButton(
                text: "Add Truck Post",
                onPressed: () {},
                color: themeColor,
              ),
              RoundButton(
                text: "Calculate Distance",
                onPressed: () {},
                color: themeColor,
              ),
              RoundButton_outline(
                text: "Back",
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
              )
            ],
          ),
        ));
  }
}
