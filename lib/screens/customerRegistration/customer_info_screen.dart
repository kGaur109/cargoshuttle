
import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../constants.dart';
import 'package:cargoshuttle/components/rounded_button.dart';

import 'customer_registration_screen.dart';

class CustomerInfoScreen extends StatefulWidget {
  static const String id = 'customer_info_screen';
  final email1;
  CustomerInfoScreen({this.email1});

  @override
  _CustomerInfoScreenState createState() => _CustomerInfoScreenState(email1);
}

final userRef = Firestore.instance.collection('customer');

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  String address;
  String city;
  String pin;
  String state;
  String dob;

  final email1;
  _CustomerInfoScreenState(this.email1);

  void createRecord() async {
    await userRef
        .document(email1)
        .collection('Address Data')
        .document(email1)
        .setData({
      'address': address,
      'city': city,
      'pin': pin,
      'state': state,
      'dob': dob
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
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
                  "ADD A PROFILE PICTURE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: themeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    address = value;
                  },
                  decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'address line 1',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          address = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'city',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          pin = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'pincode',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          state = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'state',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          dob = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'DOB',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundButton(
                  text: "COMPLETE PROFILE",
                  color: themeColor,
                  onPressed: () {
                    createRecord();
                    Navigator.pushNamed(context, HomeScreen.id);
                  },
                ),
                SizedBox(
                  height: 25,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
