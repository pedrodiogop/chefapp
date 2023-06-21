import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolCategorias extends StatefulWidget {
  const RowScroolCategorias({super.key});

  @override
  State<RowScroolCategorias> createState() => _RowScroolCategoriasState();
}

class _RowScroolCategoriasState extends State<RowScroolCategorias> {
  String selectedText = '';
  List<CardItem> items = [
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Gym',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Vegan',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Carne',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Peixe',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Arroz',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Massas',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Fit',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Legumes',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Salada',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Fit',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Pizza',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Gelados',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Sem Gluten',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Sushi',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Kebab',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Bolacha',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Chocolate',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Pão',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => buildCard(items: items[index],containerWidth: 200,textfont: 20,context:context,textfontabaixo: 9,selectedText: selectedText),
          separatorBuilder: (context, _) => const SizedBox(width: 12),
          itemCount: 18,
          scrollDirection: Axis.horizontal),
    );
  }
}
