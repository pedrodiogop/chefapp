import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolRefeicao extends StatefulWidget {
  const RowScroolRefeicao({super.key});

  @override
  State<RowScroolRefeicao> createState() => _RowScroolRefeicaoState();
}

class _RowScroolRefeicaoState extends State<RowScroolRefeicao> {
  List<CardItem> items = [
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Pequeno Almoço',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Almoço/Jantar',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Lanche',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Ceia',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Bebidas',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Sobremesa',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => buildCard(items: items[index],containerWidth: 200,textfont: 20,),
          separatorBuilder: (context, _) => const SizedBox(width: 12),
          itemCount: 6,
          scrollDirection: Axis.horizontal),
    );
  }
}
