import 'package:flutter/material.dart';

Future<void> ShowAlert(context, title, text) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(text),
      );
    },
  );
}
