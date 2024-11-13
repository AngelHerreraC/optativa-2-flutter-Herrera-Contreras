import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';

class productDetailScreen extends StatelessWidget{
  final Product product;

  productDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: product.id.toString()),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.network(product.thumbnail),
            Text(product.title),
            Text(product.description),
            Text("Precio: ${product.price}"),
            Text("Stock: ${product.stock}"),
          ],
        ),
        ),
      );
  }
}
