import 'package:cargoshuttle/constants.dart';
import 'package:cargoshuttle/screens/chat_screen.dart';
import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:cargoshuttle/screens/profile_card_screen.dart';
import 'package:cargoshuttle/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cargoshuttle/components/data_card.dart';
import 'package:cargoshuttle/components/addMenu.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class SelfPosts extends StatefulWidget {
  static const String id = 'self_posts_screen';

  @override
  _SelfPostsState createState() => _SelfPostsState();
}

final _auth = FirebaseAuth.instance;

class _SelfPostsState extends State<SelfPosts> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print("Error in current user!");
      print(e);
    }
  }

  Future<void> _signOut(BuildContext context) async {
    await _auth.signOut().then((_) {
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => WelcomeScreen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Your Posts"),
        centerTitle: true,
        backgroundColor: themeColor,
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.remove('email');
              _signOut(context);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PostsStream(),
          ],
        ),
      ),
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
              onPressed: () {
                // Navigator.popAndPushNamed(context, HomeScreen.id);
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.archive,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, SelfPosts.id);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddMenu(),
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ChatScreen()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => ProfileCardScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class PostsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('Load Post').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: themeColor,
            ),
          );
        }
        final posts = snapshot.data.documents.reversed;
        List<DataCard> dataCards = [];
        for (var post in posts) {
          final userName = post.data['userName'];
          final origin = post.data['origin'];
          final destination = post.data['destination'];
          final loadType = post.data['loadType'];
          final loadWeight = post.data['loadWeight'];
          final eta = post.data['eta'];
          final email1 = post.data['email'];

          final currentUser = loggedInUser.email;

          if (currentUser == email1) {
            final card = DataCard(
              color: themeColor,
              userName: userName,
              origin: origin,
              destination: destination,
              loadType: loadType,
              loadWeight: loadWeight,
              ETA: eta,
            );
            dataCards.add(card);
          }
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: dataCards,
          ),
        );
      },
    );
  }
}
