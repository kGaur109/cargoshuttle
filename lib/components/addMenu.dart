import 'package:cargoshuttle/components/rounded_button.dart';
import 'package:cargoshuttle/components/rounded_button_outline.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:cargoshuttle/screens/add_load_screen.dart';
import 'package:cargoshuttle/screens/add_truck_screen.dart';
import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';

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
                onPressed: () {
                  Navigator.pushNamed(context, AddLoadScreen.id);
                },
                color: themeColor,
              ),
              RoundButton(
                text: "Add Truck Post",
                onPressed: () {
                  Navigator.pushNamed(context, AddTruckScreen.id);
                },
                color: themeColor,
              ),
              RoundButton(
                text: "Calculate Distance",
                onPressed: () {
                  AndroidIntent intent = AndroidIntent(
                      package: "com.google.android.apps.maps",
                      action: "action_view");
                  intent.launch();
                },
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
