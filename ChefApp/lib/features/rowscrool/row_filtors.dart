import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolFiltros extends StatefulWidget {
  const RowScroolFiltros({super.key});

  @override
  State<RowScroolFiltros> createState() => _RowScroolFiltrosState();
}

class _RowScroolFiltrosState extends State<RowScroolFiltros> {
  List<CardItem> items = [
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Tempo',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Calorias',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Preço',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Gostos',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // 150 do containner 
      child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => buildCard(items: items[index],containerWidth: 100,textfont: 13,),
          separatorBuilder: (context, _) => const SizedBox(width: 12),
          itemCount: 4,
          scrollDirection: Axis.horizontal),
    );
  }
}
