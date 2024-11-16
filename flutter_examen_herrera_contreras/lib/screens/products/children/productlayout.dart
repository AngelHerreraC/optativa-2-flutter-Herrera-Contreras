import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/domain/dto/category.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/useCase/productsusecase.dart';
import 'package:flutter_examen_herrera_contreras/screens/products/children/card.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';

class productLayout extends StatefulWidget{
  final String category;

  const productLayout({super.key, required this.category});

  @override
  productLayoutState createState() => productLayoutState();
}

class productLayoutState extends State<productLayout>{

  late final ProductUseCase useCase;
  late Future<List<Product>> products;


  @override
  void initState() {
    super.initState();
    final authService = AuthService();
    final useCase = ProductUseCase(authService);
    products = useCase.getProductsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(future: products, builder: (context, snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if (snapshot.hasError) {
        return const Center(child: Text("Error."));
      }

      if (snapshot.hasData) {
        final productsData = snapshot.data!;
        if(productsData.isNotEmpty){
          return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: productsData.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: productsData[index]);
                },
              );
        }
        else{
          return Center(child: Text("No hay productos de categoria: ${widget.category}"));
        }
        
      }

      return Center(child: Text("No hay productos de categoria: ${widget.category}"));


    });
  }
}