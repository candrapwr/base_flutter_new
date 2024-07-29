import 'package:flutter/cupertino.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import 'routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    Routes.loginRoute: (context) => const LoginScreen(),
    Routes.homeRoute: (context) => const HomeScreen(),
  };
}
