import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:cargoshuttle/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  static const String id = 'Check_Login';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _auth = FirebaseAuth.instance;

  @override
  initState() {
    _auth
        .currentUser()
        .then((currentUser) => {
              if (currentUser == null)
                {Navigator.pushNamed(context, WelcomeScreen.id)}
              else
                {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()))
                      .catchError((err) => print(err))
                }
            })
        .catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loading..."),
        ),
      ),
    );
  }
}
