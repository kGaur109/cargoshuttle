import 'package:cargoshuttle/components/current_user.dart';
import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cargoshuttle/components/rounded_button.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddLoadScreen extends StatefulWidget {
  static const String id = 'add_load_screen';

  @override
  _AddLoadScreenState createState() => _AddLoadScreenState();
}

final userRef = Firestore.instance.collection('Load Post');

class _AddLoadScreenState extends State<AddLoadScreen> {
  final CurrentUser currentUser = CurrentUser();

  String userName;
  String origin;
  String destination;
  String loadType;
  String loadWeight;
  String eta;

  var email;

  void createRecord() async {
    if (email != null) {
      await userRef.document().setData({
        'userName': userName,
        'origin': origin,
        'destination': destination,
        'loadType': loadType,
        'loadWeight': loadWeight,
        'eta': eta,
        'email': email
      });
    }
  }

  Future<void> userEmail() async {
    email = await currentUser.getEmail();
    setState(() {});
  }

  @override
  void initState() {
    userEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Load Posting Details",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    userName = value;
                  },
                  decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'User Name',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          origin = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'from',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Origin City';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.local_shipping_outlined,
                      size: 32.0,
                      color: themeColor,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          destination = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'to',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Destination City';
                          }
                          return null;
                        },
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
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          loadType = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'type',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Load Type';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.assignment_outlined,
                      size: 32.0,
                      color: themeColor,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          loadWeight = value;
                        },
                        decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'weight',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Load Weight';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    eta = value;
                  },
                  decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'Expected Time of Delivery',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter ETA';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundButton(
                  text: "Post the load",
                  color: themeColor,
                  onPressed: () {
                    createRecord();
                    Fluttertoast.showToast(
                      msg: "Load posted successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: themeColor,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    Navigator.popAndPushNamed(context, HomeScreen.id);
                  },
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
