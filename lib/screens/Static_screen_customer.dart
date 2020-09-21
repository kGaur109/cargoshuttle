
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cargoshuttle/constants.dart';
import 'package:cargoshuttle/screens/customer_registration_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


// ignore: camel_case_types
class StaticScreen_customer extends StatelessWidget {
  static const String id = 'Static_Customer';


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30),
              width: 400,
              child: Text.rich(
                TextSpan(
                  text: 'Let us handle your logistics, calculate your ',
                  style: TextStyle(fontSize: 28 , color: Colors.blue[900]),// default text style
                  children: <TextSpan>[
                    TextSpan(text: 'toll, ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'calculate your '),
                    TextSpan(text: 'distance ', style: TextStyle(fontWeight: FontWeight.bold),),
                    TextSpan(text: 'just ', ),
                    TextSpan(text: 'at one tap ', style: TextStyle(fontWeight: FontWeight.bold),),
                    TextSpan(text: 'with '),
                    TextSpan(text: 'live tracking ', style: TextStyle(fontWeight: FontWeight.bold),),
                    TextSpan(text: 'of your package. ',)
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),

            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(0,20, 60,0),
              child: FloatingActionButton(
                backgroundColor: themeColor,
                child: Icon(
                  Icons.arrow_forward,
                ),
                onPressed: () {
                  Navigator.pushNamed(
                      context, CustomerRegistrationScreen.id);
                },
              ),
            ),
            SizedBox(height:100,),
            Image.asset('assets/images/customer-truck.png',
            ),

          ],
        ),
      ),
    );
  }
}
