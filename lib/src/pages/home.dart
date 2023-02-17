import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_form/src/controller/home_screen_controller.dart';
import 'package:flutter_form/src/Utils/buttons.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends StateMVC<HomeScreen> {
  HomeScreenController _con;

  HomeScreenState() : super(HomeScreenController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _con.scaffoldKey,
        // resizeToAvoidBottomPadding: false,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Positioned(
                top: MediaQuery.of(context).size.height / 10,
                child: Text(
                  "Registro de Usuarios APP",
                  style: Theme.of(context).textTheme.title,
                )),
            Positioned(
              top: MediaQuery.of(context).size.height / 4,
              child: Image.asset(
                'assets/img/logo_no_background.png',
                width: MediaQuery.of(context).size.width / 2,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 3.5,
              child: CustomButtonWidget(
                widthButton: MediaQuery.of(context).size.width / 2,
                text: "Registrar",
                colorText: Colors.white,
                colorButton: Theme.of(context).primaryColor,
                onPressed: () async {
                  Navigator.of(context).pushReplacementNamed('/register');
                },
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 4.5,
              child: CustomButtonWidget(
                widthButton: MediaQuery.of(context).size.width / 2,
                text: "Ver Usuarios",
                colorText: Colors.white,
                colorButton: Theme.of(context).primaryColor,
                onPressed: () async {
                  Navigator.of(context).pushReplacementNamed('/see_users');
                },
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 10,
              child: CustomButtonWidget(
                widthButton: MediaQuery.of(context).size.width / 2,
                text: "Eliminar Base de datos",
                colorText: Colors.white,
                colorButton: Theme.of(context).accentColor,
                onPressed: () async {
                  _con.eliminarBD(context);
                },
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height / 40,
                child: Column(
                  children: [
                    Text(
                      "@Copyrigth 2023",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "All Rights Reserved by Jaime Arias",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
