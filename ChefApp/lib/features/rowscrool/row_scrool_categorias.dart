import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolCategorias extends StatefulWidget {
  const RowScroolCategorias({super.key});

  @override
  State<RowScroolCategorias> createState() => _RowScroolCategoriasState();
}

class _RowScroolCategoriasState extends State<RowScroolCategorias> {
  List<CardItem> items = [
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Gym',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Vegan',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Carne',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Peixe',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Arroz',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Massas',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Fit',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Legumes',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Salada',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Fit',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Pizza',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Gelados',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Sem Gluten',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Sushi',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Kebab',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Bolacha',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Chocolate',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Pão',
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
          itemCount: 18,
          scrollDirection: Axis.horizontal),
    );
  }
}
