import 'package:flutter/material.dart';
import 'package:chefapp/features/drawwer/drawer.dart';
import 'package:chefapp/features/rowscrool/row_scrool_categorias_first.dart';
import 'package:chefapp/features/rowscrool/row_scrool_estatisticas.dart';
import 'package:routemaster/routemaster.dart';

import '../../rowscrool/row_scrool_refeicoes_first.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToRefeicao(BuildContext context, int indexTipo) {
    Routemaster.of(context).push('/refeicoes/$indexTipo');
  }

   void navigateToCategoria(BuildContext context, int indexTipo) {
    Routemaster.of(context).push('/categorias/$indexTipo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      drawer: const Drawwer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          GestureDetector(
            onTap: () => navigateToRefeicao(context, 6), // alterar isto
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                //textAlign: TextAlign.left,
                'Refeições',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const RowScroolRefeicaoFirst(),
          GestureDetector(
            onTap: () =>
            navigateToCategoria(context,18),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                //textAlign: TextAlign.left,
                'Categorias',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const RowScroolCategoriasFirst(),
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Estatisticas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
                    const RowScroolEstatisticas(),
        ],
      )),
    );
  }
}
