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
            Image(
              image: AssetImage('images/Truck Logo black.png'),
            ),
            RoundButton(
              text: "Login",
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: themeColor,
            ),
            RoundButton(
              text: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationHomeScreen.id);
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
