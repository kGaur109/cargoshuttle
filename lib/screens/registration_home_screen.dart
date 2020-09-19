import 'package:cargoshuttle/screens/customer_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:cargoshuttle/components/rounded_button.dart';
import 'package:cargoshuttle/constants.dart';
import 'owner_registration_screen.dart';

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
                    Navigator.pop(context);
                  },
                ),
              ),
              Image(
                image: AssetImage('images/Truck Logo black.png'),
              ),
              RoundButton(
                text: "As a Fleet Owner",
                onPressed: () {
                  Navigator.pushNamed(context, OwnerRegistrationScreen.id);
                },
                color: themeColor,
              ),
              RoundButton(
                text: "As a Customer",
                onPressed: () {
                  Navigator.pushNamed(context, CustomerRegistrationScreen.id);
                },
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
