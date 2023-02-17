import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_form/src/controller/list_screen_controller.dart';
import 'package:flutter_form/src/Utils/buttons.dart';
import 'package:flutter_form/src/Utils/user_card.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListScreenState();
  }
}

class ListScreenState extends StateMVC<ListScreen> {
  ListScreenController _con;

  ListScreenState() : super(ListScreenController()) {
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
        appBar: AppBar(
          centerTitle: true,
          title: Text("Usuarios"),
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: _con.users.length == 0
                        ? Text(
                            "No hay usuarios registrados",
                            style: Theme.of(context).textTheme.body1,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _con.users.length,
                            itemBuilder: (context, index) {
                              return UserCardWidget(
                                name: _con.users[index].name,
                                lastname: _con.users[index].lastname,
                                birthday: _con.users[index].birthday,
                                address: _con.users[index].address,
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 20,
              child: CustomButtonWidget(
                widthButton: MediaQuery.of(context).size.width / 2,
                text: "Volver",
                colorText: Colors.white,
                colorButton: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
