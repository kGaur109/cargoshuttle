import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DataCard extends StatelessWidget {
  DataCard(
      {this.color,
      this.userName,
      this.origin,
      this.destination,
      this.loadType,
      this.truckType,
      this.expectedTime});

  final Color color;
  final String userName;
  final String origin;
  final String destination;
  final String loadType;
  final String truckType;
  final String expectedTime;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Container(
        child: Material(
          elevation: 5.0,
          color: color,
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
                      "Name: $userName",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "From: $origin",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "To: $destination",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Load Type: $loadType",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Truck Type: $truckType",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "Expected Delivery Time: $expectedTime",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.phone),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.message),
                      color: Colors.greenAccent,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.account_circle),
                      color: Colors.white,
                      onPressed: () {},
                    )
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
