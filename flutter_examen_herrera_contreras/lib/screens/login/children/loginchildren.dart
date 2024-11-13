import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/domain/repository/categoriesrepository.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/useCase/categoryusecase.dart';
import 'package:flutter_examen_herrera_contreras/modules/login/domain/dto/usercredentials.dart';
import 'package:flutter_examen_herrera_contreras/modules/login/useCase/loginusecase.dart';
import 'package:flutter_examen_herrera_contreras/screens/categories/categoryscreen.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mybutton.dart';
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
        const Padding(padding: EdgeInsets.all(20)),
        customButton(text: "Log In", onClick: () async{
          final String user = usernameController.text;
          final String password = passwordController.text;

          final loginUseCase usecase = loginUseCase();
          try{
            await usecase.call(userCredentials(username: user, password: password));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => categoryScreen(usecase: categoryUseCase(categoriesRepository(AuthService())))),
            );
          }catch(e){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Credenciales incorrectas')));
          }


        } ),
        //button
      ],
    );
  }
}