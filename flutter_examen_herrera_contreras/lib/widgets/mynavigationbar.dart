import 'package:flutter/material.dart';

class customNavBar extends StatelessWidget{

  int currentIndex = 0;
  void Function(int) onPressed;

  customNavBar({super.key, required this.currentIndex, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onPressed,
      items: const [
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