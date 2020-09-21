import 'package:cargoshuttle/screens/customer_info_screen.dart';
import 'package:cargoshuttle/screens/registration_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cargoshuttle/components/rounded_button.dart';

class CustomerRegistrationScreen extends StatefulWidget {
  static const String id = 'customer_registration_screen';

  @override
  _CustomerRegistrationScreenState createState() =>
      _CustomerRegistrationScreenState();
}

class _CustomerRegistrationScreenState
    extends State<CustomerRegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String password;
  String email;
  String name;
  String phone;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: SvgPicture.asset('assets/images/registration image.svg',
                      height: 300,
                      width: 300,),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity, color: Colors.white,),
                      hintText: "Fullname",
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: misc, width: 5,
                        )
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: misc,
                        width: 5,),
                      )
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email , color: Colors.white,),
                      hintText: "Email address",
                      hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: misc, width: 5,
                        )
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: misc, width: 5,
                        )
                      )

                    ),

                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,

                    onChanged: (value) {
                      phone = value;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call , color: Colors.white,),
                        hintText: "Contact Number",
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: misc, width: 5,
                            )
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: misc, width: 5,
                            )
                        )

                    ),

                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock , color: Colors.white,),
                        hintText: "Create Password",
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: misc, width: 5,
                            )
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: misc, width: 5,
                            )
                        )

                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RoundButton(
                    text: 'Register',
                    color: Colors.white,
                    onPressed: () async {
                      Navigator.pushNamed(context, CustomerInfoScreen.id);
                      // setState(() {
                      //   showSpinner = true;
                      // });
                      // try {
                      //   final newUser = await _auth.createUserWithEmailAndPassword(
                      //       email: email, password: password);
                      //   if (newUser != null) {
                      //     Navigator.pushNamed(context, CustomerInfoScreen.id);
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
          ],
        ),
      ),
    );
  }
}
