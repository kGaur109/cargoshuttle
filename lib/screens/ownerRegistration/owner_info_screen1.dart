import 'file:///C:/Users/karti/Desktop/3rd%20Semester/Design%20Thinking%20and%20Innovation/Cargoshuttle/cargoshuttle/lib/screens/customerRegistration/customer_registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../constants.dart';
import 'package:cargoshuttle/components/rounded_button.dart';
import 'owner_info_screen2.dart';

class OwnerInfoScreen1 extends StatefulWidget {
  static const String id = 'owner_info_screen1';
  final email1;
  OwnerInfoScreen1({this.email1});

  @override
  _OwnerInfoScreen1State createState() => _OwnerInfoScreen1State(email1);
}

class _OwnerInfoScreen1State extends State<OwnerInfoScreen1> {
  String ownerName;
  String contactNumber;
  String email;
  String password;

  final email1;
  _OwnerInfoScreen1State(this.email1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 60.0,
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
                height: 35.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  ownerName = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'owner name',
                    hintStyle: TextStyle(color: Colors.grey.shade600)),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  contactNumber = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                  hintText: 'contact number',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecorationWhite.copyWith(
                    hintText: 'email address',
                    hintStyle: TextStyle(color: Colors.grey.shade600)),
              ),
              SizedBox(
                height: 10.0,
              ),
              RoundButton(
                text: "ENTER COMPANY INFO",
                color: themeColor,
                onPressed: () {
                  var emailPassed = email1;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OwnerInfoScreen2(email1: emailPassed)));
                },
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: <Widget>[
              //     FloatingActionButton(
              //       backgroundColor: themeColor,
              //       child: Icon(
              //         Icons.arrow_forward,
              //       ),
              //       onPressed: () {
              //         Navigator.pushNamed(
              //             context, CustomerRegistrationScreen.id);
              //       },
              //     )
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    elevation: 3,
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
    );
  }
}
