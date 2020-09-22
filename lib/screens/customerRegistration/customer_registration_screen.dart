import 'package:cargoshuttle/components/rounded_button_outline.dart';
import 'package:cargoshuttle/screens/registration_home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'customer_info_screen.dart';

class CustomerRegistrationScreen extends StatefulWidget {
  static const String id = 'customer_registration_screen';

  @override
  _CustomerRegistrationScreenState createState() =>
      _CustomerRegistrationScreenState();
}

final userRef = Firestore.instance.collection('customer');

class _CustomerRegistrationScreenState
    extends State<CustomerRegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String password;
  String email;
  String name;
  String phone;

  final email1 = new TextEditingController();

  void createRecord() async {
    await userRef
        .document(email)
        .collection('Basic Data')
        .document(email)
        .setData({
      'password': password,
      'name': name,
      'email': email,
      'phone': phone
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
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
                    Navigator.pushNamed(context, RegistrationHomeScreen.id);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.text,
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
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: email1,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
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
                          ))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        phone = value;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.call,
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
                          ))),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
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
                          ))),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    RoundButton_outline(
                      text: 'REGISTER',
                      onPressed: () async {
                        var emailEntered = email1.text;
                        createRecord();
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) => CustomerInfoScreen(email1: email_entered)
                        // ));
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          if (newUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CustomerInfoScreen(
                                  email1: emailEntered,
                                ),
                              ),
                            );
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        } catch (e) {
                          print(e);
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
    );
  }
}
