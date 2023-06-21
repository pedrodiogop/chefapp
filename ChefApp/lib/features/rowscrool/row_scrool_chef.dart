import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolChef extends StatefulWidget {
  const RowScroolChef({super.key});

  @override
  State<RowScroolChef> createState() => _RowScroolChefState();
}

class _RowScroolChefState extends State<RowScroolChef> {
  String selectedText='';
  List<CardItem> items = [
    CardItem(
    text: '',
      image: Constants.pequenoalmoco,
      title: 'Pequeno Almoço',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Almoço/Jantar',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Lanche',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Ceia',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Bebidas',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Sobremesa',
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
          itemBuilder: (context, index) => buildCard(items: items[index],containerWidth: 200,textfont: 20,context: context,textfontabaixo: 9,selectedText:selectedText),
          separatorBuilder: (context, _) => const SizedBox(width: 12),
          itemCount: 6,
          scrollDirection: Axis.horizontal),
    );
  }
}
