import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mybutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cartScreen extends StatefulWidget{

  @override
  cartScreenState createState() => cartScreenState();
}

class cartScreenState extends State<cartScreen>{
  List<Map<String,dynamic>> cartItems = [];
  double finalPrice = 0;

  Future<void> getCartItems() async {
    final stored = await SharedPreferences.getInstance();
    final String? data = stored.getString('cart');
    if(data != null){
      setState(() {
        cartItems = List<Map<String,dynamic>>.from(json.decode(data));
        cartItems.forEach((element) {
          finalPrice += element['price'];
        },);
      });
    }
  }

  Future<void> resetCart() async {
    final stored = await SharedPreferences.getInstance();
    await stored.remove('cart');
    setState(() {
      cartItems = [];
      finalPrice = 0;
    });
  }

  void removeItem(int index) async{
    setState(() {
      cartItems.removeAt(index);
    });
    final stored = await SharedPreferences.getInstance();
    stored.setString('cart', json.encode(cartItems));
  }

  @override
  void initState() {
    getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(title: "Carrito"),
      body: cartItems.isEmpty ? const Center(child: Text("El carrito esta vacio")) 
      :
      Column(
        children: [
          Expanded(child: ListView.builder(itemCount: cartItems.length, itemBuilder:(context, index) {
            Product item = Product.fromJson(cartItems[index]);
            return Card(margin: const EdgeInsets.all(2), child: ListTile(title: Text(item.title), subtitle: Column(
              children: [
                Text("Precio: ${item.price}"),
              ],
            ),
            trailing: customButton(text: "Remover", onClick: ()=>(removeItem(index))),),);
          },))
        ],
      )
    );
  }
}