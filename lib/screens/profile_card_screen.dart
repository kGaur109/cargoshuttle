import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:cargoshuttle/components/current_user.dart';
import 'package:cargoshuttle/components/customer.dart';

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
    String name = currentUser?.fleetOwner?.name;
    String address = currentUser?.fleetOwner?.address;
    String phone = currentUser?.fleetOwner?.phone;
    String email = currentUser?.fleetOwner?.email;

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
              height: 100.0,
            ),
            Container(
              child: Material(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Name: $name",
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Address: $address",
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Phone Number: $phone",
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Email: $email",
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
