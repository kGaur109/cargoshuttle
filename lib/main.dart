import 'package:flutter/material.dart';
import 'screens/WelcomeScreen.dart';
import 'screens/LoginScreen.dart';
import 'screens/RegistrationHomeScreen.dart';

void main() {
  runApp(Cargoshuttle());
}

class Cargoshuttle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationHomeScreen.id: (context) => RegistrationHomeScreen(),
      },
    );
  }
}
