import 'package:cargoshuttle/components/rounded_button_outline.dart';
import 'package:cargoshuttle/screens/ownerRegistration/owner_info_screen.dart';
import 'package:cargoshuttle/screens/registration_home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OwnerRegistrationScreen extends StatefulWidget {
  static const String id = 'owner_registration_screen';

  @override
  _OwnerRegistrationScreenState createState() =>
      _OwnerRegistrationScreenState();
}

final userRef = Firestore.instance.collection('fleet owners');
final _formKey = GlobalKey<FormState>();

class _OwnerRegistrationScreenState extends State<OwnerRegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String password;
  String email;
  String name;
  String contactNumber;

  final email1 = new TextEditingController();

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  void createRecord() async {
    await userRef
        .document(email)
        .collection('Basic Data')
        .document(email)
        .setData({
      'password': password,
      'name': name,
      'email': email,
      'contact_no': contactNumber
    }).then((value) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('email', email);
      pref.setInt('userType', 0);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_backspace,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => RegistrationHomeScreen()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: SvgPicture.asset(
                            'assets/images/registration image.svg',
                            height: 300,
                            width: 300,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            hintText: "fullname",
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: misc,
                              width: 5,
                            )),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: misc,
                                width: 5,
                              ),
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your full name';
                          } else if (isNumeric(value.toString()) == true) {
                            return "Please enter name in characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: email1,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            hintText: "email address",
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: misc,
                              width: 5,
                            )),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: misc,
                                width: 5,
                              ),
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Correct email';
                          }
                          if (!RegExp(
                                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                              .hasMatch(value)) {
                            return 'Please enter a valid email Address';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) {
                            contactNumber = value;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              hintText: "contact number",
                              hintStyle: TextStyle(color: Colors.white),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: misc,
                                width: 5,
                              )),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: misc,
                                  width: 5,
                                ),
                              )),
                          validator: (value) {
                            if (isNumeric(value.toString()) == false) {
                              return "Please enter contact no in digits";
                            } else if (isNumeric(value.toString()) == true) {
                              if (value.length != 10) {
                                return "Please enter 10 digitphone no";
                              }
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: "create password",
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: misc,
                              width: 5,
                            )),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: misc,
                                width: 5,
                              ),
                            )),
                        validator: (value) => value.length < 6
                            ? "Enter Minimum 6 character password"
                            : null,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      RoundButton_outline(
                        text: 'REGISTER',
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newUser != null) {
                                var emailEntered = email1.text;
                                createRecord();
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => OwnerInfoScreen2(
                                            email1: emailEntered)));
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
