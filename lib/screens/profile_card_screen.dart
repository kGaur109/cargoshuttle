import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:cargoshuttle/components/current_user.dart';
import 'package:cargoshuttle/components/customer.dart';

class ProfileCardScreen extends StatelessWidget {
  final Customer customer = Customer();
  final CurrentUser currentUser = CurrentUser();
  static const String id = 'profile_card_screen';

  @override
  Widget build(BuildContext context) {
    currentUser.setUserType(1);

    // String name = currentUser.customer.name;
    // String address = currentUser.customer.address;
    // String phone = currentUser.customer.phone;
    // String email = currentUser.customer.email;

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
                          "Name: ",
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Address: ",
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Phone Number: ",
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "Email: ",
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
