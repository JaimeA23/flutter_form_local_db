import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_form/src/controller/database_controller.dart';

class HomeScreenController extends ControllerMVC {
  ValueNotifier<Map<String, double>> progress = new ValueNotifier(new Map());
  GlobalKey<ScaffoldState> scaffoldKey;

  HomeScreenController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  DataBaseController _condb = DataBaseController();

  @override
  void initState() {}

  eliminarBD(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("!Peligro!"),
          content: Text(
              "Solo use esta opcion si desea eliminar por completo TODOS los usuarios"),
          actions: <Widget>[
            TextButton(
              child: const Text('Si quiero eliminar la BD actual'),
              onPressed: () async {
                await _condb.DeleteBd();
                await _condb.CreateTable();
                Navigator.of(context).pushNamed('/home');
              },
            ),
            TextButton(
              child: const Text('No, no quiero borrarla'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
