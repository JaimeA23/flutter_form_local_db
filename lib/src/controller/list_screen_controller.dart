import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_form/src/controller/database_controller.dart';
import 'package:flutter_form/src/models/user_model.dart';
import 'package:flutter_form/src/Utils/alert.dart';

class ListScreenController extends ControllerMVC {
  ValueNotifier<Map<String, double>> progress = new ValueNotifier(new Map());
  GlobalKey<ScaffoldState> scaffoldKey;

  ListScreenController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }
  List<User> users = [];

  @override
  void initState() {
    ListUsers();
  }

  Future<bool> ListUsers() async {
    users = [];
    DataBaseController _condb = DataBaseController();

    try {
      var list = await _condb.GetUser();
      List<String> addresses = [];

      for (var user in list[0]) {
        User userResult = User.fromJSON(user);
        for (var address in list[1]) {
          var addressUser = address['id_user'].toString();
          if (addressUser == userResult.id) {
            addresses.add(address['address'].toString());
          }
        }
        userResult.address = addresses;
        addresses = [];
        users.add(userResult);
      }

      setState(() {});

      return true;
    } catch (e) {
      Navigator.of(context).pushReplacementNamed('/home');
      ShowAlert(context, "Error","Lo sentimos ha surgido un error al leer los usuarios existentes");
      return false;
    }
  }
}
