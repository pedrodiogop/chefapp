import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/row_scrool_categorias.dart';
import 'package:chefapp/features/rowscrool/row_filtors.dart';


class Categorias extends StatefulWidget {
  const Categorias({super.key});

  @override
  State<Categorias> createState() => _CategoriasState();
}


class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('Categorias')),
      body: SingleChildScrollView(
          child: Column(
        children: const [
           RowScroolCategorias(),
           RowScroolFiltros(),
        ]
),
      ),
      );
  }
}
