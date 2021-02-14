import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName ='/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Image.asset(
          'ScanRay.png',
          alignment: Alignment.centerLeft,
        ),
      actions: <Widget>[
        FlatButton(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(1),

              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                      Icon(

                        Icons.circle ,
                        color: Colors.white,
                        size: 70,

                      ),

                  ],
                ),
              ),
            ],
          ),
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          },
        ),
      ],
      ),


      body: Center(
        child: Text(
          'This is my home screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,

          ),
        ),

      ),
    );
  }
}
