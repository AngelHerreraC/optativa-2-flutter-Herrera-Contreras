import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/domain/dto/category.dart';
import 'package:flutter_examen_herrera_contreras/modules/categories/useCase/categoryusecase.dart';
import 'package:flutter_examen_herrera_contreras/router/router.dart';
import 'package:flutter_examen_herrera_contreras/router/routes.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';
import 'package:flutter_examen_herrera_contreras/widgets/mynavigationbar.dart';

class categoryScreen extends StatelessWidget{
  final categoryUseCase usecase;
  final List<Widget> screens = [];
  categoryScreen({super.key, required this.usecase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(title: "Categorias"),
      bottomNavigationBar: customNavBar(currentIndex: 0, context: context),
      body: FutureBuilder(future: usecase.execute(), builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError){
          return const Center(child: Text("Error."));
        }

        if (snapshot.hasData){
          List<category> categories = snapshot.data!;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index){
              final xcategory = categories[index];
              return ListTile(
                title: Text(xcategory.name),
                onTap: (){
                  Navigator.pushNamed(context, RouterS.products, arguments: xcategory.name);
                },
              );
            },
          );

        }
      
        return Center(child: Text("No hay categorias"));
      
      }),
    );
  }
}