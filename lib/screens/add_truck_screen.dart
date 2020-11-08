import 'package:cargoshuttle/components/current_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cargoshuttle/components/rounded_button.dart';
import 'package:cargoshuttle/constants.dart';

class AddTruckScreen extends StatefulWidget {
  static const String id = 'add_truck_screen';

  @override
  _AddTruckScreenState createState() => _AddTruckScreenState();
}

final userRef = Firestore.instance.collection('Truck Post');

class _AddTruckScreenState extends State<AddTruckScreen> {

  final CurrentUser currentUser = CurrentUser();

  String userName;
  String origin;
  String destination;
  String truckType;
  String loadType;
  String eta;

  var email;

  void createRecord() async {
    if(email!= null)
    {
      await userRef
          .document(email)
          .setData({
        'userName': userName,
        'origin': origin,
        'destination': destination,
        'truckType': truckType,
        'loadType': loadType,
        'eta': eta
      });
    }
  }

  Future<void> userEmail() async {
    email = await currentUser.getEmail();
    setState(() {

    });
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
                  "Truck Posting Details",
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
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    truckType = value;
                  },
                  decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'Truck Type',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter truck type';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                // DropdownButton(
                //   items: [
                //     DropdownMenuItem(
                //       child: Text('8 wheeler'),
                //     )
                //   ],
                //   onChanged: (value) {},
                // ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    loadType = value;
                  },
                  decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'Load Type',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter load type';
                    }
                    return null;
                  },
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
                  text: "Post the truck",
                  color: themeColor,
                  onPressed: () {
                    createRecord();
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
