import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'StarRating.dart';

import 'current_user.dart';

class DataCard extends StatefulWidget {
  DataCard(
      {this.color,
      this.userName,
      this.origin,
      this.destination,
      this.loadType,
      this.truckType,
      this.loadWeight,
      // ignore: non_constant_identifier_names
      this.ETA});

  final Color color;
  final String userName;
  final String origin;
  final String destination;
  final String loadType;
  final String truckType;
  final String loadWeight;
  // ignore: non_constant_identifier_names
  final String ETA;

  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {

  final CurrentUser currentUser = CurrentUser();
  final StarRating sRating = StarRating();
  var email;
  var phone_no;

  Future<void> userEmail() async {
    await currentUser.setUserType();
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

    if(currentUser?.userType == '0')
      phone_no = currentUser.fleetOwner.phone;
    else if(currentUser?.userType == '1')
      phone_no = currentUser.customer.phone;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Container(
        child: Material(
          elevation: 5.0,
          color: widget.color,
          borderRadius: BorderRadius.circular(10.0),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Name: ${widget.userName}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "From: ${widget.origin}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "To: ${widget.destination}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Load Type: ${widget.loadType}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Truck Type: ${widget.truckType}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Expected Delivery Time: ${widget.ETA}",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    StarRating(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.phone),
                      color: Colors.red,
                      onPressed: () {
                        launch("tel://${phone_no}");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.message),
                      color: Colors.greenAccent,
                      onPressed: () {
                        launch("sms:${phone_no}");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.email),
                      color: Colors.white,
                      onPressed: () {
                        launch("mailto:${email}");
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




