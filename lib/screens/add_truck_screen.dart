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
  bool _is_Checked = false;
  void createRecord() async {
    if (email != null) {
      await userRef.document(email).setData({
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
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
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
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    userName = value;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.perm_identity,
                        size: 30,
                        color: themeColor,
                      ),
                      hintText: "username",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: themeColor,
                        width: 2,
                      )),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor,
                          width: 2,
                        ),
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the username';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          origin = value;
                        },
                        decoration: InputDecoration(
                            hintText: "from",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: themeColor,
                              width: 2,
                            )),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: themeColor,
                                width: 2,
                              ),
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Origin City';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Icon(
                      Icons.local_shipping_outlined,
                      size: 40.0,
                      color: themeColor,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          destination = value;
                        },
                        decoration: InputDecoration(
                            hintText: "to",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: themeColor,
                              width: 2,
                            )),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: themeColor,
                                width: 2,
                              ),
                            )),
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
                  height: 30.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    truckType = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Truck Type",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: themeColor,
                        width: 2,
                      )),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor,
                          width: 2,
                        ),
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter truck type';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.0,
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
                  decoration: InputDecoration(
                      hintText: "Load Type",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: themeColor,
                        width: 2,
                      )),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor,
                          width: 2,
                        ),
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter load type';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    eta = value;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.access_time_outlined,
                        size: 30,
                        color: themeColor,
                      ),
                      hintText: "Expected Time of Delivery",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: themeColor,
                        width: 2,
                      )),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor,
                          width: 2,
                        ),
                      )),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter ETA';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                CheckboxListTile(
                  title: Text(
                    "Agree to the terms and conditions",
                    style: TextStyle(
                        fontSize: 16,
                        color: themeColor,
                        decoration: TextDecoration.underline),
                  ),
                  value: _is_Checked,
                  onChanged: (bool value) {
                    setState(() {
                      _is_Checked = value;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                RoundButton(
                  text: "POST THE AD",
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
