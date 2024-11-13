import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/domain/repository/categoriesrepository.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/useCase/categoryusecase.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/useCase/productsusecase.dart';
import 'package:flutter_examen_herrera_contreras/screens/categories/categoryscreen.dart';
import 'package:flutter_examen_herrera_contreras/screens/login/loginscreen.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';
import 'router.dart';

class Routes {
  static final Map<String, Widget Function(BuildContext)> Screens = {
    RouterS.login: (context) => const LoginScreen(),
    RouterS.categories: (context) {
      final categoryUseCase catUseCase = categoryUseCase(categoriesRepository(AuthService()));
      return categoryScreen(usecase: catUseCase);
    },
    RouterS.products: (context){
      final ProductUseCase productUseCase = ProductUseCase(AuthService());
      return Center(child: Text("No ha sido implementado aun.."));
    }
  };
}