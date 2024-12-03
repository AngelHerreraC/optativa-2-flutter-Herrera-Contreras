import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/router/router.dart';
import 'package:flutter_examen_herrera_contreras/screens/purchasecomplete/purchasescreen.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mybutton.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mynavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class seenScreen extends StatefulWidget {
  @override
  seenScreenState createState() => seenScreenState();
}

class seenScreenState extends State<seenScreen> {
  List<Map<String, dynamic>> seenItems = [];

  Future<void> getSeenItems() async {
    final stored = await SharedPreferences.getInstance();
    final String? data = stored.getString('seen');
    if (data != null) {
      setState(() {
        seenItems = List<Map<String, dynamic>>.from(json.decode(data));
      });
    }
  }

  Future<void> resetSeen() async {
    final stored = await SharedPreferences.getInstance();
    await stored.remove('seen');
    setState(() {
      seenItems = [];
    });
  }

  @override
  void initState() {
    getSeenItems();
    super.initState();
  }

  void doNothing(int x) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(title: "Historial"),
      bottomNavigationBar: customNavBar(currentIndex: 1, onPressed: doNothing),
      body: seenItems.isEmpty
          ? const Center(child: Text("No se han visto productos"))
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: seenItems.length,
                  itemBuilder: (context, index) {
                    Product item = Product.fromJson(seenItems[index]);
                    return Card(
                      margin: const EdgeInsets.all(2),
                      child: ListTile(
                        title: Text(item.title),
                        subtitle: Column(
                          children: [
                            Text("Precio: ${item.price}"),
                          ],
                        ),
                        trailing: customButton(
                            text: "Borrar historial de vista",
                            onClick: () => (resetSeen)),
                      ),
                    );
                  },
                )),
              ],
            ),
    );
  }
}
