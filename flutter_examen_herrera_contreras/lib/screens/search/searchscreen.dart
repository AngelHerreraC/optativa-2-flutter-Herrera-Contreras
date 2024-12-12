import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/infrastructure/connection/connection.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/screens/details/detailscreen.dart';
import 'package:flutter_examen_herrera_contreras/screens/products/children/card.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mybutton.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mynavigationbar.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mytextfield.dart';

class searchScreen extends StatefulWidget{
    @override
    searchScreenState createState() => searchScreenState();
}

class searchScreenState extends State<searchScreen>{
    List<dynamic> results = [];
    final TextEditingController controller = TextEditingController();

    Future<void> search(String text) async{
        try{
            final response = await Connection().get('https://dummyjson.com/products/search?q=$text');
            setState(() {
              results = response['products'];
            });
        }
        catch(e){
            setState(() {  
                results.clear();
            });
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: const customAppBar(title: "Busqueda"),
            bottomNavigationBar: customNavBar(currentIndex: 1, context: context),
            body: Column(
                children: [
                    const Padding(padding: EdgeInsets.all(16)),
                    customTextfield(
                        placeholderText: "Buscar",
                        controller: controller,
                    ),
                    customButton(
                        text: "Buscar", 
                        onClick: (){search(controller.text);}
                    ),
                    Expanded(child: results.isEmpty ? const Center(child: Text("No se encontraron resultados")) :ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (context, index){
                            Product product = Product.fromJson(results[index]);
                            return ProductCard(product: product);
                        },
                    )
                    )
                ],
            ),
        );
    }
}