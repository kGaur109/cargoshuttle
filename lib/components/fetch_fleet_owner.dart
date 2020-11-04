import 'package:flutter/material.dart';
import 'fleet_owner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchFleetOwner
{
  FleetOwner fleetOwner;
  String currentEmail;

  FetchFleetOwner({this.fleetOwner, this.currentEmail});

  Future<String> getEmail() async
  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String email = pref.getString('email');
    this.currentEmail = email;
    return this.currentEmail;

  }

  void printEmail()
  {
    print("Hi: ${this.currentEmail}");
  }


}


