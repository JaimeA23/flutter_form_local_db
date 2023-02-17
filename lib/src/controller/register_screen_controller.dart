import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_form/src/controller/database_controller.dart';

class RegisterScreenController extends ControllerMVC {
  ValueNotifier<Map<String, double>> progress = new ValueNotifier(new Map());
  GlobalKey<ScaffoldState> scaffoldKey;

  RegisterScreenController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  int addressNumber;

  @override
  void initState() {
    addressNumber = 1;
  }

  Future<bool> registerUser(name, lastname, birthday, addresses) async {
    name = name.toUpperCase();
    lastname = lastname.toUpperCase();
    DataBaseController _condb = DataBaseController();
    try {
      List<String> addressesClean = [];

      for (var address in addresses) {
        if (address != "") {
          addressesClean.add(address);
        }
      }
      int iduser = await _condb.InsertUser("$name", "$lastname", birthday);
      await _condb.InsertAddress(iduser, addressesClean);

      if (iduser == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  AddAddress() {
    addressNumber = addressNumber + 1;
    setState(() {});
  }
}
