import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'Models/authentication.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 // static const Color transparent = Color(0xFF021BFD);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication())
      ],
      child: MaterialApp(
        title: "ScanRay App" ,
        theme: ThemeData(
          primaryColor:Color(0xFF1C33FD),
        ),
          home: LoginScreen(),
        routes: {
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },

      ),
    );
  }
}
