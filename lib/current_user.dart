import 'package:cargoshuttle/components/customer.dart';
import 'package:cargoshuttle/components/fleet_owner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

final customerData = Firestore.instance.collection('customer');
final fleetOwnerData = Firestore.instance.collection('fleet owners');

class CurrentUser {
  int userType; // 0 for fleet owner and 1 for customer
  Customer customer;
  FleetOwner fleetOwner;
  String currentEmail;


  CurrentUser({this.userType, this.customer, this.fleetOwner, this.currentEmail});

  setUserType(int userType) {
    this.userType = userType;
    getEMail();
    if(this.userType == 0)
      {
        findFleetOwner();
      }
    else if(this.userType == 1)
      {
        findCustomer();
      }
  }

  Future<void> getEMail() async
  {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String email = pref.getString('email');
    this.currentEmail = email;
  }

  findFleetOwner() async
  {
    final DocumentSnapshot docs = await fleetOwnerData.document(currentEmail).collection('Basic Data').document(currentEmail).get();
    this.fleetOwner.name = docs.data['name'];
    this.fleetOwner.email = docs.data['email'];
    this.fleetOwner.password = docs.data['password'];
    this.fleetOwner.contactNumber = docs.data['contactNumber'];

    final DocumentSnapshot docs2 = await fleetOwnerData.document(currentEmail).collection('Company Data').document(currentEmail).get();
    this.fleetOwner.companyName = docs2.data['companyName'];
    this.fleetOwner.address = docs2.data['address'];
    this.fleetOwner.city = docs2.data['city'];
    this.fleetOwner.pin = docs2.data['pin'];
    this.fleetOwner.state = docs2.data['state'];
    this.fleetOwner.phone = docs2.data['phone'];
    this.fleetOwner.pan = docs2.data['pan'];
    this.fleetOwner.gst = docs2.data['gst'];

  }

  findCustomer() async
  {
    final DocumentSnapshot docs = await customerData.document(currentEmail).collection('Basic Data').document(currentEmail).get();
    this.customer.name = docs.data['name'];
    this.customer.email = docs.data['email'];
    this.customer.password = docs.data['password'];
    this.customer.phone = docs.data['phone'];

    final DocumentSnapshot docs2 = await customerData.document(currentEmail).collection('Address Data').document(currentEmail).get();
    this.customer.address = docs2.data['address'];
    this.customer.city = docs2.data['city'];
    this.customer.pin = docs2.data['pin'];
    this.customer.state = docs2.data['state'];
    this.customer.dob = docs2.data['dob'];
  }

}
