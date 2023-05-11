import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolEstatisticas extends StatefulWidget {
  const RowScroolEstatisticas({super.key});

  @override
  State<RowScroolEstatisticas> createState() => _RowScroolEstatisticasState();
}

class _RowScroolEstatisticasState extends State<RowScroolEstatisticas> {
  List<CardItem> items = [
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Prato com mais likes',
      onTap: () {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      image: Constants.pequenoalmoco,
      title: 'Chef com mais seguidores',
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
          itemCount: 2,
          scrollDirection: Axis.horizontal),
    );
  }
}
