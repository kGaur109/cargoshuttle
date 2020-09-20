import 'package:cargoshuttle/screens/customer_registration_screen.dart';
import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import 'package:cargoshuttle/components/rounded_button.dart';

import 'owner_info_screen1.dart';

class OwnerInfoScreen2 extends StatefulWidget {
  static const String id = 'owner_info_screen2';

  @override
  _OwnerInfoScreen2State createState() => _OwnerInfoScreen2State();
}

class _OwnerInfoScreen2State extends State<OwnerInfoScreen2> {
  String companyName;
  String address;
  String city;
  String pin;
  String state;
  String phone;
  String pan;
  String gst;

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
                      Navigator.pushNamed(context, OwnerInfoScreen1.id);
                    },
                  )
                ],
              ),
              // SizedBox(
              //   height: 24.0,
              // ),
              // CircleAvatar(
              //   backgroundColor: themeColor,
              //   child: Icon(
              //     Icons.account_circle,
              //     size: 100.0,
              //   ),
              //   radius: 80.0,
              // ),
              // SizedBox(
              //   height: 12.0,
              // ),
              // Text(
              //   "User Profile",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     color: themeColor,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20.0,
              //   ),
              // ),
              SizedBox(
                height: 24.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  companyName = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                  hintText: 'Company Name',
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  address = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                  hintText: 'Company Address',
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        city = value;
                      },
                      decoration: kTextFieldDecorationWhite.copyWith(
                        hintText: 'City',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        pin = value;
                      },
                      decoration: kTextFieldDecorationWhite.copyWith(
                        hintText: 'Pin code',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        state = value;
                      },
                      decoration: kTextFieldDecorationWhite.copyWith(
                        hintText: 'State',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        phone = value;
                      },
                      decoration: kTextFieldDecorationWhite.copyWith(
                        hintText: 'Phone Number',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  pan = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                  hintText: 'PAN Number',
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  gst = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                  hintText: 'GST Number',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundButton(
                text: "Complete Profile",
                color: themeColor,
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
