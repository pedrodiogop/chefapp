import 'package:flutter/material.dart';
import 'package:chefapp/features/myappar/myappbar.dart';
import 'package:chefapp/features/drawwer/drawer.dart';
import 'package:chefapp/features/rowscrool/row_scrool_refeicao.dart';
import 'package:chefapp/features/rowscrool/row_filtors.dart';


class Refeicoes extends StatefulWidget {
  const Refeicoes({super.key});

  @override
  State<Refeicoes> createState() => _RefeicoesState();
}

class _RefeicoesState extends State<Refeicoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: MyAppBar('Refeições'),
      drawer: const Drawwer(),
      body: SingleChildScrollView(
          child: Column(
        children: const [
           RowScroolRefeicao(),
           RowScroolFiltros(),
        ]
),
      ),
      );
  }
}
