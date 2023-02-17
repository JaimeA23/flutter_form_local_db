import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_form/src/controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends StateMVC<SplashScreen> {
  SplashScreenController _con;

  SplashScreenState() : super(SplashScreenController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/img/logo.png',
                width: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 100),
              CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Theme.of(context).hintColor),
              ),
              SizedBox(height: 100),
              Text(
                "@Copyrigth 2023",
                style: TextStyle(fontSize: 10),
              ),
              Text(
                "All Rights Reserved by Jaime Arias",
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
