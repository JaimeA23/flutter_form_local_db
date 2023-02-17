import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_form/src/controller/register_screen_controller.dart';
import 'package:flutter_form/src/Utils/buttons.dart';
import 'package:intl/intl.dart';
import 'package:flutter_form/src/Utils/alert.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends StateMVC<RegisterScreen> {
  RegisterScreenController _con;

  RegisterScreenState() : super(RegisterScreenController()) {
    _con = controller;
  }

  final _signUpFormKey = GlobalKey<FormState>();

  String _firstname, _lastname = "";
  List<String> addresses = [""];

  DateTime currentDate = DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registro de Usuario"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  signUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpForm() {
    return Form(
      key: _signUpFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: nameInput(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 30),
              child: lastNameInput(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: dateInput(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: addressesInput(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: buttons(),
            ),
          ],
        ),
      ),
    );
  }

  Widget nameInput() {
    String nameLabel = "Ingresa un nombre";
    String invalidNameMessage = "Nombre invalido";

    return TextFormField(
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.body1,
      decoration: InputDecoration(
        labelText: nameLabel,
        icon: Icon(Icons.account_box),
      ),
      textInputAction: TextInputAction.next,
      validator: (firstname) =>
          textValidator(firstname, 2, 20) ? null : invalidNameMessage,
      onChanged: (firstname) => _firstname = firstname,
    );
  }

  Widget lastNameInput() {
    String lastNameLabel = "Ingresa un apellido";
    String invalidLastNameMessage = "Apellido invalido";

    return TextFormField(
      //controller: _controllerLastName,
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.body1,
      decoration: InputDecoration(
        labelText: lastNameLabel,
        icon: Icon(Icons.account_box),
      ),
      textInputAction: TextInputAction.next,
      validator: (lastname) =>
          textValidator(lastname, 2, 20) ? null : invalidLastNameMessage,
      onChanged: (lastname) => _lastname = lastname,
    );
  }

  Widget dateInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: Colors.black54,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Escoge tu fecha de nacimiento:  ",
              style: Theme.of(context).textTheme.body1,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
            ),
            GestureDetector(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    DateFormat('dd/MM/yyyy').format(currentDate).toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              onTap: () => _selectDate(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget addressesInput() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _con.addressNumber,
            itemBuilder: (context, index) {
              return addressInput(index);
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CustomButtonWidget(
          widthButton: MediaQuery.of(context).size.width / 2,
          text: "Agregar Otra Dirección",
          colorText: Colors.white,
          colorButton: Theme.of(context).primaryColor,
          onPressed: () async {
            addresses.add("");
            _con.AddAddress();
          },
        ),
      ],
    );
  }

  Widget addressInput(index) {
    String nameLabel = "Ingresa una dirección";

    return TextFormField(
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.body1,
      decoration: InputDecoration(
        labelText: nameLabel,
        icon: Icon(Icons.home),
      ),
      textInputAction: TextInputAction.next,
      onChanged: (address) => addresses[index] = address,
    );
  }

  Widget buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButtonWidget(
          widthButton: MediaQuery.of(context).size.width / 3,
          text: "Registrar",
          colorText: Colors.white,
          colorButton: Theme.of(context).primaryColor,
          onPressed: () async {
            registerAction();
          },
        ),
        SizedBox(
          width: 10,
        ),
        CustomButtonWidget(
          widthButton: MediaQuery.of(context).size.width / 3,
          text: "Cancelar",
          colorText: Colors.white,
          colorButton: Theme.of(context).accentColor,
          onPressed: () async {
            Navigator.of(context).pushReplacementNamed('/home');
          },
        ),
      ],
    );
  }

  bool textValidator(text, int minLenght, int maxLenght) {
    Pattern pattern = r"^[a-zA-ZÀ-ÿ ,.']{" +
        minLenght.toString() +
        "," +
        maxLenght.toString() +
        "}\$";
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(text))
      return false;
    else
      return true;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2024));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  registerAction() async {
    final form = _signUpFormKey.currentState;
    DateTime birthdate = currentDate;
    DateTime nowdate = DateTime.now();

    if (form.validate() &&
        addresses[0] != "" &&
        (birthdate.compareTo(nowdate) < 0)) {
      bool register = await _con.registerUser(_firstname, _lastname,
          DateFormat('dd/MM/yyyy').format(currentDate).toString(), addresses);

      if (register) {
        Navigator.of(context).pushReplacementNamed('/home');
        ShowAlert(context, "Registrado", "El Usuario ha sido registrado");
      } else {
        Navigator.of(context).pushReplacementNamed('/home');
        ShowAlert(
            context, "Error", "Lo sentimos ha surgido un error en el registro");
      }
    } else if (addresses[0] == "") {
      ShowAlert(context, "Falta Dirección","Por favor ingresa al menos una dirección");
    } else if (birthdate.compareTo(nowdate) > 0) {
      ShowAlert(context, "Fecha Invalida", "Por favor, escoge tu fecha de nacimiento");
    }
  }
}
