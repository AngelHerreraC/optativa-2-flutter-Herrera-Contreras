import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const customAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        title,
        style: const TextStyle(fontSize: 28, color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}