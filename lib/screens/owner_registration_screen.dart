import 'package:flutter/material.dart';

class OwnerRegistrationScreen extends StatelessWidget {
  static const String id = 'owner_registration_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 50,
                  ),
                  onPressed: () {Navigator.pop(context);},
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage('images/Truck Logo black.png',),
               ),
              ),
              Container(
                width: 180,
                height: 50,
                child: RaisedButton(child: Text("As a fleet owner?"),
                  onPressed: () {},
                  color: Colors.black,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white)),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  splashColor: Colors.black,
                  elevation: 12,
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:Colors.grey.withOpacity(0.7),

                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: Offset(6,5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 180,
                height: 50,
                child: RaisedButton(child: Text("As a customer?"),
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  splashColor: Colors.white,
                  elevation: 12,
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: Offset(6,5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
