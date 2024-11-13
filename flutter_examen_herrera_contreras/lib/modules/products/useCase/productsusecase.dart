import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/repository/productrepository.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';

class ProductUseCase {
  final ProductRepository repository;

  // Constructor que recibe AuthService y lo pasa a ProductRepository
  ProductUseCase(AuthService auth) : repository = ProductRepository(auth);

  Future<List<Product>> getProductsByCategory(String category) async {
    return await repository.fetchProductsByCategory(category);
  }
}
