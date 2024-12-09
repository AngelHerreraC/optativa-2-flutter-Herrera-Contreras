import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/useCase/productsusecase.dart';
import 'package:flutter_examen_herrera_contreras/modules/reviews/domain/dto/review.dart';
import 'package:flutter_examen_herrera_contreras/screens/details/detailscreen.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  late List<Review> reviews;
  List<Map<String, dynamic>> revs = [];

  ProductCard({super.key, required this.product});

  Future<void> getReviews() async{
    reviews = await ProductUseCase(AuthService()).repository.fetchReviewsByProductID(product.id);
    reviews.forEach((element) => revs.add(element.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    getReviews();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(product.thumbnail, height: 100,),
            Center(
              child: Text(
                product.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 2),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double .infinity, 
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => productDetailScreen(product: product, reviews: revs),
                      ),
                    );
                  },
                  child: const Text("Details"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
