import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_form/src/controller/database_controller.dart';

class SplashScreenController extends ControllerMVC {
  ValueNotifier<Map<String, double>> progress = new ValueNotifier(new Map());
  GlobalKey<ScaffoldState> scaffoldKey;

  SplashScreenController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  DataBaseController _condb = DataBaseController();

  @override
  void initState() {
    changeScrean();
  }

  changeScrean() async {
    await _condb.CreateTable();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed('/home');
    });
  }
}
