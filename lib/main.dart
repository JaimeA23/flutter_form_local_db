import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_form/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends AppMVC {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'flutter form',
        initialRoute: '/Splash',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlueAccent,
          accentColor: Colors.red,
          cardColor: Colors.blue[100],
          fontFamily: 'Montserrat',
          textTheme: TextTheme(
            title: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
                fontFamily: 'Montserrat'),
            body1: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                fontFamily: 'Hind'),
            body2: TextStyle(
                fontSize: 17.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontFamily: 'Hind'),
          ),
        ));
  }
}
