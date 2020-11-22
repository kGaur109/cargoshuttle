import 'package:cargoshuttle/screens/add_load_screen.dart';
import 'package:cargoshuttle/screens/add_truck_screen.dart';
import 'package:cargoshuttle/screens/customerRegistration/customer_info_screen.dart';
import 'package:cargoshuttle/screens/home_screen.dart';
import 'package:cargoshuttle/screens/ownerRegistration/owner_info_screen.dart';
import 'package:cargoshuttle/screens/profile_card_screen.dart';
import 'package:cargoshuttle/screens/self_posts_screen.dart';
import 'package:cargoshuttle/screens/staticScreens/static_fleet_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_home_screen.dart';
import 'screens/customerRegistration/customer_registration_screen.dart';
import 'screens/ownerRegistration/owner_registration_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/staticScreens/static_screen_customer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var email = pref.getString('email');

  runApp(Cargoshuttle(email: email));
}

class Cargoshuttle extends StatelessWidget {
  final String email;
  Cargoshuttle({this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: HomeScreen.id,
      initialRoute: email == null ? WelcomeScreen.id : HomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationHomeScreen.id: (context) => RegistrationHomeScreen(),
        CustomerRegistrationScreen.id: (context) =>
            CustomerRegistrationScreen(),
        StaticScreenFleet.id: (context) => StaticScreenFleet(),
        StaticScreenCustomer.id: (context) => StaticScreenCustomer(),
        CustomerInfoScreen.id: (context) => CustomerInfoScreen(),
        OwnerRegistrationScreen.id: (context) => OwnerRegistrationScreen(),
        OwnerInfoScreen2.id: (context) => OwnerInfoScreen2(),
        HomeScreen.id: (context) => HomeScreen(),
        SelfPosts.id: (context) => SelfPosts(),
        ChatScreen.id: (context) => ChatScreen(),
        ProfileCardScreen.id: (context) => ProfileCardScreen(),
        AddLoadScreen.id: (context) => AddLoadScreen(),
        AddTruckScreen.id: (context) => AddTruckScreen(),
      },
    );
  }
}
