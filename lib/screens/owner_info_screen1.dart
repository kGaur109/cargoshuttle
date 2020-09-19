import 'package:cargoshuttle/screens/customer_registration_screen.dart';
import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import 'package:cargoshuttle/components/rounded_button.dart';

import 'owner_info_screen2.dart';

class OwnerInfoScreen1 extends StatefulWidget {
  static const String id = 'owner_info_screen1';

  @override
  _OwnerInfoScreen1State createState() => _OwnerInfoScreen1State();
}

class _OwnerInfoScreen1State extends State<OwnerInfoScreen1> {
  String ownerName;
  String contactNumber;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: themeColor,
                    child: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, CustomerRegistrationScreen.id);
                    },
                  )
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              CircleAvatar(
                backgroundColor: themeColor,
                child: Icon(
                  Icons.account_circle,
                  size: 100.0,
                ),
                radius: 80.0,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                "User Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  ownerName = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                  hintText: 'Owner Name',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  contactNumber = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                  hintText: 'Contact Number',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                  hintText: 'Email Address',
                ),
              ),
              SizedBox(
                height: 34.0,
              ),
              RoundButton(
                text: "Proceed",
                color: themeColor,
                onPressed: () {
                  Navigator.pushNamed(context, OwnerInfoScreen2.id);
                },
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: <Widget>[
              //     FloatingActionButton(
              //       backgroundColor: themeColor,
              //       child: Icon(
              //         Icons.arrow_forward,
              //       ),
              //       onPressed: () {
              //         Navigator.pushNamed(
              //             context, CustomerRegistrationScreen.id);
              //       },
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
