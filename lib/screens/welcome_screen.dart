import 'package:cargoshuttle/components/rounded_button_outline.dart';
import 'package:cargoshuttle/screens/login_screen.dart';
import 'package:cargoshuttle/screens/registration_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:cargoshuttle/components/rounded_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
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
              height: 70,
            ),
            RoundButton(
              text: "REGISTER",
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => RegistrationHomeScreen()));
              },
              color: themeColor,
            ),
            RoundButton_outline(
              text: "LOGIN",
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginScreen()));
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
