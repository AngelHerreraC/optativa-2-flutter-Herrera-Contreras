import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/screens/login/loginscreen.dart';
import 'router.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> Screens = {
    RouterS.login: (context) => const LoginScreen(),
  };
}