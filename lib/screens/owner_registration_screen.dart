import 'package:cargoshuttle/screens/registration_home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cargoshuttle/components/rounded_button.dart';

import 'fleet_owner.dart';
import 'owner_info_screen1.dart';

class OwnerRegistrationScreen extends StatefulWidget {
  static const String id = 'owner_registration_screen';

  @override
  _OwnerRegistrationScreenState createState() =>
      _OwnerRegistrationScreenState();
}

final userRef = Firestore.instance.collection('fleet owners');

class _OwnerRegistrationScreenState extends State<OwnerRegistrationScreen> {
 // final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String password;
  String email;
  String name;
  String phone;

  final email1 = new TextEditingController();

 /* void createRecord() async {
    await userRef
        .document(email).collection('Basic Data').document(email)
        .setData({
      'ownerName': name,
      'contactNumber': phone,
      'email': email,
      'password': password
    });
  } */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_back,
                      color: themeColor,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationHomeScreen.id);
                    },
                  )
                ],
              ),
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Full Name',
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: email1,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Email address',
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  phone = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Contact Number'),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Create Password'),
              ),
              SizedBox(
                height: 30.0,
              ),
              RoundButton(
                text: 'Register',
                color: Colors.white,
                onPressed: () async {
                  var email_entered = email1.text;
                //  createRecord();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OwnerInfoScreen1(),
                  ));//(context, OwnerInfoScreen1.id);
                  // setState(() {
                  //   showSpinner = true;
                  // });
                  // try {
                  //   final newUser = await _auth.createUserWithEmailAndPassword(
                  //       email: email, password: password);
                  //   if (newUser != null) {
                  //     Navigator.pushNamed(context, HomeScreen.id);
                  //   }
                  //   setState(() {
                  //     showSpinner = false;
                  //   });
                  // } catch (e) {
                  //   print(e);
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
