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
  var phoneNumber;

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
    if (currentUser?.userType == '0')
      phoneNumber = currentUser.fleetOwner.phone;
    else if (currentUser?.userType == '1')
      phoneNumber = currentUser.customer.phone;

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
                    Text.rich(
                      TextSpan(
                        text: '', // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                          TextSpan(
                              text: '${widget.userName}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '', // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: 'From: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                          TextSpan(
                              text: '${widget.origin}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '', // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: 'To: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                          TextSpan(
                              text: '${widget.destination}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '', // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Load Type: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                          TextSpan(
                              text: '${widget.loadType}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '', // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Truck Type: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                          TextSpan(
                              text: '${widget.truckType}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text.rich(
                      TextSpan(
                        text: '', // default text style
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Expected Delivery Time: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white)),
                          TextSpan(
                              text: '${widget.ETA}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
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
                        launch("tel://$phoneNumber");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.message),
                      color: Colors.greenAccent,
                      onPressed: () {
                        launch("sms:$phoneNumber");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.email),
                      color: Colors.white,
                      onPressed: () {
                        launch("mailto:$email");
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
