import 'package:cargoshuttle/components/rounded_button_outline.dart';
import 'package:cargoshuttle/screens/staticScreens/static_fleet_screen.dart';
import 'package:cargoshuttle/screens/staticScreens/static_screen_customer.dart';
import 'package:cargoshuttle/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cargoshuttle/components/rounded_button.dart';
import 'package:cargoshuttle/constants.dart';

class RegistrationHomeScreen extends StatelessWidget {
  static const String id = 'registration_home_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: themeColor,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Image.asset(
                  "assets/images/cargoshuttle logo3.png",
                  height: 150,
                  width: 150,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Cargo Shuttle",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arbutus Slab',
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'your logistics genie',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Playfair Display',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 65,
              ),
              RoundButton_outline(
                text: "As a fleet owner?",
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => StaticScreenFleet()));
                },
                color: Colors.white,
              ),
              RoundButton(
                text: "As a customer?",
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => StaticScreenCustomer()));
                },
                color: themeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
