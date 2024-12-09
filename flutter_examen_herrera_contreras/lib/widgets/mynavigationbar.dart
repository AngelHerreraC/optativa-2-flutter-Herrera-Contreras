import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/domain/repository/categoriesrepository.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/useCase/categoryusecase.dart';
import 'package:flutter_examen_herrera_contreras/screens/cart/cart.dart';
import 'package:flutter_examen_herrera_contreras/screens/categories/categoryscreen.dart';
import 'package:flutter_examen_herrera_contreras/screens/search/searchscreen.dart';
import 'package:flutter_examen_herrera_contreras/screens/seenproducts/seenproducts.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';

class customNavBar extends StatelessWidget{
  
  final categoryUseCase catUseCase = categoryUseCase(categoriesRepository(AuthService()));
  int currentIndex = 0;
  BuildContext context;
  void onPressed(int x){
    final List<Widget> screens = [categoryScreen(usecase: catUseCase), searchScreen(), seenScreen(), cartScreen()];
    Navigator.push(context, MaterialPageRoute(builder: (context) => screens[x]));
  }

  customNavBar({super.key, required this.currentIndex, required this.context});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onPressed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
          backgroundColor: Colors.lightBlue),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
          backgroundColor: Colors.lightBlue),
        BottomNavigationBarItem(
          icon: Icon(Icons.history), 
          label: 'History',
          backgroundColor: Colors.lightBlue),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), 
          label: 'Cart',
          backgroundColor: Colors.lightBlue),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), 
          label: 'Profile',
          backgroundColor: Colors.lightBlue),
      ]
      );
  }
}