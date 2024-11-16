import 'package:flutter/material.dart';

class customTextfield extends StatelessWidget {
  final String placeholderText;
  final TextEditingController controller;

  const customTextfield({super.key, required this.placeholderText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(), 
        labelText: placeholderText
      ),
    );
  }
}
