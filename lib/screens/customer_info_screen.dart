import 'package:cargoshuttle/screens/customer_registration_screen.dart';
import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import 'package:cargoshuttle/components/rounded_button.dart';

class CustomerInfoScreen extends StatefulWidget {
  static const String id = 'customer_info_screen';

  @override
  _CustomerInfoScreenState createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  String address;
  String city;
  String pin;
  String state;
  String dob;

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
                          context, CustomerRegistrationScreen1.id);
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
                  address = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                  hintText: 'Address',
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
                        address = value;
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
                        dob = value;
                      },
                      decoration: kTextFieldDecorationWhite.copyWith(
                        hintText: 'DOB',
                      ),
                    ),
                  ),
                ],
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
