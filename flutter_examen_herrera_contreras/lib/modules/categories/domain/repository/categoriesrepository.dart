// lib/repository/category_repository.dart
import 'dart:convert';
import 'package:flutter_examen_herrera_contreras/modules/categories/domain/dto/category.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';
import 'package:http/http.dart' as http;

class categoriesRepository {
  final String apiUrl = "https://dummyjson.com/products/categories";
  final AuthService authService;

  categoriesRepository(this.authService);

  Future<List<category>> getCategories() async {
    final token = await authService.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      List categoriesJson = json.decode(response.body);
      return categoriesJson.map((json) => category.fromJson(json)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
