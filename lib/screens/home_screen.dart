import 'package:cargoshuttle/constants.dart';
import 'package:cargoshuttle/screens/chat_screen.dart';
import 'package:cargoshuttle/screens/ownerRegistration/owner_registration_screen.dart';
import 'package:cargoshuttle/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final _auth = FirebaseAuth.instance;

class _HomeScreenState extends State<HomeScreen> {
  @override

  Future <void> _signOut(BuildContext context) async {
    await _auth.signOut().then((_) {
      Navigator.push(context, new MaterialPageRoute (
          builder: (context) =>
          WelcomeScreen())
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CargoShuttle"),
        backgroundColor: themeColor,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: themeColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.remove('email');
          _signOut(context);
      },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
