import 'package:flutter_examen_herrera_contreras/modules/categories/domain/dto/category.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/domain/repository/categoriesrepository.dart';

class categoryUseCase {
  final categoriesRepository repository;

  categoryUseCase(this.repository);

  Future<List<category>> execute() async {
    return await repository.getCategories();
  }
}
