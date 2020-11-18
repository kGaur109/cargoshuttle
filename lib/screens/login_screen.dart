import 'package:cargoshuttle/components/rounded_button_outline.dart';
import 'package:cargoshuttle/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'home_screen.dart';

//enum userType { Customer, FleetOwner }

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  bool showSpinner = false;
  String email;
  String password;
  String uType; // 1 for customer, 0 for fleet owner
  //userType _value = userType.Customer;

  // ignore: non_constant_identifier_names
  Future<void> SP() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
    pref.setString('userType', uType);
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
                  height: 15,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(
                      Icons.keyboard_backspace,
                      size: 50,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset(
                            'assets/images/login screen image new.png',
                            height: 300,
                            width: 300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextField(
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
                            hintText: "enter your email",
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
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
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
                            hintText: "password",
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
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          uType = value;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_box_outlined,
                              color: Colors.white,
                            ),
                            hintText: "0 for fleet owner and 1 for customer",
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
                            return 'Please enter correct user type';
                          } else if ((value != '0') && (value != '1')) {
                            return 'Please enter 0 or 1 for user type';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RoundButton_outline(
                        text: 'LOGIN',
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();

                            try {
                              final currentUser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (currentUser != null) {
                                SP();
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => HomeScreen()));
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }

                            //Scaffold.of(context).showSnackBar(SnackBar(content: Text('This is valid!')));
                          } else {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Not valid!')));
                          }
                          setState(() {
                            showSpinner = true;
                          });
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
