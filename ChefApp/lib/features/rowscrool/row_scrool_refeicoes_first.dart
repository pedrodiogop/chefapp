import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';
import 'package:routemaster/routemaster.dart';

class RowScroolRefeicaoFirst extends StatefulWidget {
  const RowScroolRefeicaoFirst({super.key});

  @override
  State<RowScroolRefeicaoFirst> createState() => _RowScroolRefeicaoFirstState();
}

void navigateToRefeicao(BuildContext context, int indexTipo) {
  Routemaster.of(context).push('/refeicoes/$indexTipo');
}


class _RowScroolRefeicaoFirstState extends State<RowScroolRefeicaoFirst> {
  List<CardItem> items = [
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Pequeno Almoço',
      onTap: (context) {
        navigateToRefeicao(context,0);
      },
    ),
    CardItem(
      text: '',
      image: Constants.lunch,
      title: 'Almoço/Jantar',
      onTap: (context) {
navigateToRefeicao(context,1);      },
    ),
    CardItem(
      text: '',
      image: Constants.lanche,
      title: 'Lanche',
      onTap: (context) {
navigateToRefeicao(context,2);      },
    ),
    CardItem(
      text: '',
      image: Constants.ceia,
      title: 'Ceia',
      onTap: (context) {
navigateToRefeicao(context,3);      },
    ),
    CardItem(
      text: '',
      image: Constants.bebidas,
      title: 'Bebidas',
      onTap: (context) {
navigateToRefeicao(context,4);      },
    ),
    CardItem(
      text: '',
      image: Constants.sobremesa,
      title: 'Sobremesa',
      onTap: (context) {
navigateToRefeicao(context,5);      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => buildCard(
              items: items[index],
              containerWidth: 200,
              textfont: 20,
              context: context),
          separatorBuilder: (context, _) => const SizedBox(width: 12),
          itemCount: 6,
          scrollDirection: Axis.horizontal),
    );
  }
}
