import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mynavigationbar.dart';

class Profilescreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Profile info"),
      bottomNavigationBar: customNavBar(currentIndex: 4, context: context),
      body: Center(
        child: Text("Informacion de Usuario: W.I.P"),
      ),
      
    );
  }
}