import 'package:flutter_examen_herrera_contreras/infrastructure/connection/connection.dart';
import 'package:flutter_examen_herrera_contreras/modules/products/domain/dto/product.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';


class ProductRepository {
  final AuthService auth;

  ProductRepository(this.auth);

  Future<List<Product>> fetchProductsByCategory(String category) async {
    String url = "https://dummyjson.com/products/category/$category";

    final token = await auth.getToken();
    if (token == null) {
      throw Exception('Token not found.');
    }

    Connection connection = Connection();
    final response = await connection.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // Incluye el token en el encabezado
    });

    List productsJson = response['products'];
    return productsJson.map((item) => Product.fromJson(item)).toList();
  }
}
