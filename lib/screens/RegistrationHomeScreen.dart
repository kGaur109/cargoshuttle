import 'package:flutter/material.dart';
import 'package:cargoshuttle/components/roundedButton.dart';

class RegistrationHomeScreen extends StatelessWidget {
  static const String id = 'registration_home_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
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
                    color: Colors.white,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Image(
                image: AssetImage('images/Truck Logo white.png'),
              ),
              RoundButton(
                text: "As a Fleet Owner",
                onPressed: () {},
                color: Colors.white24,
              ),
              RoundButton(
                text: "As a Customer",
                onPressed: () {},
                color: Colors.white24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
