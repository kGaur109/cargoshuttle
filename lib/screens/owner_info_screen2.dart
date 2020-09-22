import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants.dart';
import 'package:cargoshuttle/components/rounded_button.dart';

import 'owner_info_screen1.dart';

final userRef = Firestore.instance.collection('fleet owners');

class OwnerInfoScreen2 extends StatefulWidget {
  static const String id = 'owner_info_screen2';
  final email1;
  OwnerInfoScreen2({this.email1});

  @override
  _OwnerInfoScreen2State createState() => _OwnerInfoScreen2State(email1);
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

  final email1;
  _OwnerInfoScreen2State(this.email1);

  void createRecord() async {
    await userRef
        .document(email1).collection('Company Data').document(email1)
        .setData({
      'companyName': companyName,
      'address': address,
      'city': city,
      'pin': pin,
      'state': state,
      'phone': phone,
      'pan': pan,
      'gst': gst
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
                  onChanged: (value) {
                    companyName = value;
                  },
                  decoration: kTextFieldDecorationWhite.copyWith(
                      hintText: 'company name',
                      hintStyle: TextStyle(color: Colors.grey.shade600)),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,

                  onChanged: (value) {
                    address = value;
                  },
                  decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'company address',
                      hintStyle: TextStyle(color: Colors.grey.shade600)
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
                        onChanged: (value) {
                          city = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'city',
                            hintStyle: TextStyle(color: Colors.grey.shade600)
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
                          hintText: 'pincode',
                            hintStyle: TextStyle(color: Colors.grey.shade600)
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
                          hintText: 'state',
                            hintStyle: TextStyle(color: Colors.grey.shade600)
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
                          phone = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'phone number',
                            hintStyle: TextStyle(color: Colors.grey.shade600)
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
                  onChanged: (value) {
                    pan = value;
                  },
                  decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'PAN number',
                      hintStyle: TextStyle(color: Colors.grey.shade600)
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    gst = value;
                  },
                  decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'GST number',
                      hintStyle: TextStyle(color: Colors.grey.shade600)
                  ),
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
                SizedBox(height: 40,),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
