import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mytextfield.dart';

class loginChildren extends StatelessWidget{
  Future<void> _clearCart() async {
    //clearcart
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Column(
      children: [
        customTextfield(placeholderText: "Usuario", controller: usernameController),
        const Padding(padding: EdgeInsets.all(10)),
        customTextfield(placeholderText: "Contraseña", controller: passwordController),
        //button
      ],
    );
  }
}