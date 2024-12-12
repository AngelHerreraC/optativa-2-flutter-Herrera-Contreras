import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/useCase/productsusecase.dart';
import 'package:flutter_examen_herrera_contreras/modules/reviews/domain/dto/review.dart';
import 'package:flutter_examen_herrera_contreras/screens/details/detailscreen.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';
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

  List<Review> reviews = [];
  List<Map<String, dynamic>> revs = [];

  Future<void> getReviews(int id) async{
    revs.clear();
    reviews.clear();
    reviews = await ProductUseCase(AuthService()).repository.fetchReviewsByProductID(id);
    reviews.forEach((element) => revs.add(element.toJson()));
  }


  Future<void> getSeenItems() async {
    final stored = await SharedPreferences.getInstance();
    final String? data = stored.getString('seen');
    if (data != null) {
      List<Map<String, dynamic>> items =
          List<Map<String, dynamic>>.from(json.decode(data));
      for (var item in items) {
        int productId = item['id'];
        List<Review> reviews = await ProductUseCase(AuthService())
            .repository
            .fetchReviewsByProductID(productId);
        item['reviews'] = reviews.map((review) => review.toJson()).toList();
      }
      setState(() {
        seenItems = items;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(title: "Historial"),
      bottomNavigationBar: customNavBar(currentIndex: 2, context: context),
      body: seenItems.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: seenItems.length,
                  itemBuilder: (context, index) {
                    Product item = Product.fromJson(seenItems[index]);
                    List<Map<String, dynamic>> reviews =
                        seenItems[index]['reviews'] ?? [];
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
                          text: "Ver producto",
                          onClick: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => productDetailScreen(
                                product: item,
                                reviews: reviews,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ],
            ),
    );
  }
}
