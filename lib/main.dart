import 'package:cargoshuttle/screens/customerRegistration/customer_info_screen.dart';
import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:cargoshuttle/screens/ownerRegistration/owner_info_screen1.dart';
import 'package:cargoshuttle/screens/ownerRegistration/owner_info_screen2.dart';
import 'package:cargoshuttle/screens/staticScreens/static_fleet_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_home_screen.dart';
import 'screens/customerRegistration/customer_registration_screen.dart';
import 'screens/ownerRegistration/owner_registration_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/staticScreens/static_screen_customer.dart';

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
        CustomerRegistrationScreen.id: (context) =>
            CustomerRegistrationScreen(),
        StaticScreenFleet.id: (context) => StaticScreenFleet(),
        StaticScreenCustomer.id: (context) => StaticScreenCustomer(),
        CustomerInfoScreen.id: (context) => CustomerInfoScreen(),
        OwnerRegistrationScreen.id: (context) => OwnerRegistrationScreen(),
        OwnerInfoScreen1.id: (context) => OwnerInfoScreen1(),
        OwnerInfoScreen2.id: (context) => OwnerInfoScreen2(),
        HomeScreen.id: (context) => HomeScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
