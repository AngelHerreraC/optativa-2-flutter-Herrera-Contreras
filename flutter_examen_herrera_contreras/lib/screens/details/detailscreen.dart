import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/modules/reviews/domain/dto/review.dart';
import 'package:flutter_examen_herrera_contreras/router/router.dart';
import 'package:flutter_examen_herrera_contreras/screens/cart/cart.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mybutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class productDetailScreen extends StatelessWidget{
  final Product product;
  final List<Map<String, dynamic>> reviews;

  productDetailScreen({super.key, required this.product, required this.reviews});

  Future<void> addToHistory(BuildContext context) async {
    SharedPreferences stored = await SharedPreferences.getInstance();
    String? seen = stored.getString('seen');
    List<dynamic> seenData = seen != null ? jsonDecode(seen) : [];
    seenData.add(this.product.toJson());
    await stored.setString('seen', jsonEncode(seenData));
  }

  Future<void> addToCart(BuildContext context) async {
    SharedPreferences stored = await SharedPreferences.getInstance();
    String? cart = stored.getString('cart');
    List<dynamic> cartData = cart != null ? jsonDecode(cart) : [];
    if (cartData.length < 7) {
      cartData.add(this.product.toJson());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Solo puedes agregar 7 productos al carrito.')),);
      return;
    }
    
    await stored.setString('cart', jsonEncode(cartData));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Producto agregado al carrito.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    addToHistory(context);
    return Scaffold(
      appBar: customAppBar(title: "${product.id}.-${product.title}"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Image.network(product.thumbnail),
            Text('${product.title}\n', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text("${product.description}\n"),
            Text("Precio: ${product.price}"),
            Text("Stock: ${product.stock}\n"),
            SizedBox(height: 20),
            Text("Reviews:"),
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index){
                  Review review = Review.fromJson(reviews[index]);
                  return Row(
                    children: [Text("${review.reviewerName}: \t"), Text('"${review.comment}" \t'), Text("Rating: ${review.rating}/5")],
                  );
                },
              ),
            ),
            customButton(text: "Añadir al carrito", onClick: () => addToCart(context)),
            const Spacer(),
            customButton(text: "Ir al carrito", onClick: () =>{
              Navigator.pushNamed(context, RouterS.cart)
            }),
          ],
        ),
        ),
      );
  }
}
