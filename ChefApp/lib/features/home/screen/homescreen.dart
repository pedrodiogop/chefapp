import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/features/myappar/myappbar.dart';
import 'package:chefapp/features/drawwer/drawer.dart';
import 'package:chefapp/features/rowscrool/row_scrool_categorias.dart';
import 'package:chefapp/features/rowscrool/row_scrool_estatisticas.dart';
import 'package:routemaster/routemaster.dart';

import '../../rowscrool/row_scrool_refeicoes_first.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToRefeicao(BuildContext context, int indexTipo) {
    Routemaster.of(context).push('/refeicoes/$indexTipo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Home'),
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
                Routemaster.of(context).push('/categorias'), // alterar isto
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                //textAlign: TextAlign.left,
                'Categorias',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const RowScroolCategorias(),
          GestureDetector(
       //     onTap: () {}
       //         Routemaster.of(context).push('/estatisticas'), // alterar isto
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                //textAlign: TextAlign.left,
                'Estatisticas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
                    const RowScroolEstatisticas(),
          GestureDetector(
            onTap: () => Routemaster.of(context).push('/chefs'), // alterar isto
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                //textAlign: TextAlign.left,
                'Chefs',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //const RowScroolChef(),
          GestureDetector(
            onTap: () =>
                Routemaster.of(context).push('/publicacaoSeguidores'), // alterar isto
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                //textAlign: TextAlign.left,
                'Publicações dos a Seguir',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Routemaster.of(context)
                .push('/publicacaorecentes'), // alterar isto
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                //textAlign: TextAlign.left,
                'Publicações Recentes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
