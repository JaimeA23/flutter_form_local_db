import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key key,
      @required this.widthButton,
      @required this.colorButton,
      @required this.colorText,
      @required this.text,
      @required this.onPressed})
      : super(key: key);

  final double widthButton;
  final Color colorButton;
  final Color colorText;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      width: widthButton,
      height: MediaQuery.of(context).size.height / 20,
      child: FlatButton(
        onPressed: this.onPressed,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        color: this.colorButton,
        shape: StadiumBorder(),
        child: Text(
          text,
          style: TextStyle(color: colorText),
        ),
      ),
    );
  }
}
