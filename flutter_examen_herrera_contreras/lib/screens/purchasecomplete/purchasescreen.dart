import 'package:flutter/material.dart';
import 'package:flutter_examen_herrera_contreras/widgets/myappbar.dart';

class purchaseArgs {
  final int nprods;
  final double costo;

  purchaseArgs(this.nprods, this.costo);
}

class purchaseScreen extends StatelessWidget{

  final purchaseArgs purchaseargs;
  final DateTime date = DateTime.now().toLocal();

  purchaseScreen({super.key, required this.purchaseargs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(title: "Compra finalizada"), 
      body: 
      Center(child: 
        Column(
          children: [
            Text("Productos comprados: ${purchaseargs.nprods}"),
            Text("Costo total: ${purchaseargs.costo}"),
            Text("Fecha de compra: ${date.day}/${date.month}/${date.year}"),
         ],
        ),
      )
      );
  }
}