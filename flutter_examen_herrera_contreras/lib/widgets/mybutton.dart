import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onClick;

  const customButton({super.key, required this.text, this.icon, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onClick,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16)
      ),
    );
  }
}
