import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/screens/products/children/productlayout.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';


class CategoryProductsScreen extends StatelessWidget {
  final String category;

  const CategoryProductsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(title: "Productos por categoria"),
      body: Column(
        children: [
          Expanded(child: productLayout(category: category)),
        ],
      ),
    );
  }
}
