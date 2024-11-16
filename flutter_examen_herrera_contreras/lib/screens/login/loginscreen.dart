import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/screens/login/children/loginchildren.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(title: "Login"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [loginChildren()],
        ),
      ),
    );
  }
}
