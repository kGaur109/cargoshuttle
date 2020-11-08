import 'package:cargoshuttle/components/rounded_button.dart';
import 'package:cargoshuttle/components/rounded_button_outline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:cargoshuttle/components/current_user.dart';
import 'package:cargoshuttle/components/customer.dart';

import 'home_screen.dart';

class ProfileCardScreen extends StatefulWidget {
  static const String id = 'profile_card_screen';

  @override
  _ProfileCardScreenState createState() => _ProfileCardScreenState();
}

class _ProfileCardScreenState extends State<ProfileCardScreen> {
  final Customer customer = Customer();

  final CurrentUser currentUser = CurrentUser();

  var email;

  Future<void> userEmail() async {
    await currentUser.setUserType(0);
    email = currentUser.currentEmail;
    setState(() {});
  }

  @override
  void initState() {
    userEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String name;
    String address;
    String phone;
    String email;

    if (currentUser?.userType == 0) {
      name = currentUser?.fleetOwner?.name;
      address = currentUser?.fleetOwner?.address;
      phone = currentUser?.fleetOwner?.phone;
      email = currentUser?.fleetOwner?.email;
    } else if (currentUser?.userType == 1) {
      name = currentUser?.customer?.name;
      address = currentUser?.customer?.address;
      phone = currentUser?.customer?.phone;
      email = currentUser?.customer?.email;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: themeColor,
              child: Icon(
                Icons.account_circle,
                size: 140.0,
              ),
              radius: 100.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 200,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  padding: EdgeInsets.only(bottom: 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: themeColor, width: 2),
                    borderRadius: BorderRadius.circular(5),
                    shape: BoxShape.rectangle,
                  ),
                  child: Container(
                    child: Material(
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  child: Text.rich(
                                    TextSpan(
                                      text: '', // default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Fullname: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: '$name',
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 12.0,
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  child: Text.rich(
                                    TextSpan(
                                      text: '', // default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Address: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: '$address',
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 12.0,
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  child: Text.rich(
                                    TextSpan(
                                      text: '', // default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Phone: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: '$phone',
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 12.0,
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(25, 0, 0, 0),
                                  child: Text.rich(
                                    TextSpan(
                                      text: '', // default text style
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Email: ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: '$email',
                                            style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 12.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 50,
                    top: 12,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 5, left: 10, right: 10),
                      color: Colors.white,
                      child: Text(
                        'Contact Info.',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
              child: RoundButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => HomeScreen()));
                },
                text: 'GO TO DASHBOARD',
                color: themeColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
              child: RoundButton_outline(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => HomeScreen()));
                },
                text: 'EDIT INFO',
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
