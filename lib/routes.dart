import 'package:flutter/material.dart';
import 'package:flutter_form/src/pages/splash_screen.dart';
import 'package:flutter_form/src/pages/home.dart';
import 'package:flutter_form/src/pages/list.dart';
import 'package:flutter_form/src/pages/register.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/see_users':
        return MaterialPageRoute(builder: (_) => ListScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
