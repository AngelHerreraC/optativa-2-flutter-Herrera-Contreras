import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/screens/details/detailscreen.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mybutton.dart';


class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.thumbnail),
          Center(child: Text(
              product.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              textAlign: TextAlign.center,
            )
          ),
          Center(child: customButton(text: "Details", onClick: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => productDetailScreen(product: this.product),
              )
            );
          })
          ),
        ],
      ),
    );
  }
}
