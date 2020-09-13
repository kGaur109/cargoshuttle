import 'package:cargoshuttle/screens/LoginScreen.dart';
import 'package:cargoshuttle/screens/RegistrationHomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cargoshuttle/components/roundedButton.dart';

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
              color: Colors.black87,
            ),
            RoundButton(
              text: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationHomeScreen.id);
              },
              color: Colors.black87,
            ),
//            Container(
//              width: 180,
//              height: 50,
//              child: RaisedButton(
//                child: Text("REGISTER"),
//                onPressed: () {
//
//                },
//                color: Colors.black,
//                textColor: Colors.white,
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(10)),
//                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                splashColor: Colors.black,
//                elevation: 12,
//              ),
//              decoration: BoxDecoration(boxShadow: [
//                BoxShadow(
//                  color: Colors.black12.withOpacity(0.7),
//                  spreadRadius: 0,
//                  blurRadius: 3,
//                  offset: Offset(6, 5),
//                )
//              ], borderRadius: BorderRadius.circular(10)),
//            ),
//            Container(
//              padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
//              alignment: Alignment.bottomRight,
//              child: RichText(
//                text: TextSpan(
//                    text: 'Having trouble need ',
//                    style: TextStyle(
//                      fontSize: 15.0,
//                      fontWeight: FontWeight.bold,
//                      color: Colors.black,
//                    ),
//                    children: [
//                      TextSpan(
//                        text: 'help',
//                        style: TextStyle(
//                            decoration: TextDecoration.underline,
//                            color: Colors.black),
//                      )
//                    ]),
//              ),
//            )
          ],
        ),
      ),
    );
  }
}
