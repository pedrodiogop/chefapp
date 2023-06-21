import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';
import 'package:routemaster/routemaster.dart';

class RowScroolEstatisticas extends StatefulWidget {
  const RowScroolEstatisticas({super.key});

  @override
  State<RowScroolEstatisticas> createState() => _RowScroolEstatisticasState();
}

void navigateToChefMaisSeguidores(BuildContext context) {
  Routemaster.of(context).push('/chefmaisseguidores');
}

void navigateToPratoMaisLikes(BuildContext context) {
  Routemaster.of(context).push('/pratomaislikes');
}

class _RowScroolEstatisticasState extends State<RowScroolEstatisticas> {
  String selectedText='';
  List<CardItem> items = [
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Pratos com mais likes',
      onTap: (context) {
        navigateToPratoMaisLikes(context);      
      },
    ),
    CardItem(
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Chefs com mais seguidores',
      onTap: (context) {
        navigateToChefMaisSeguidores(context);
              },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => buildCard(items: items[index],containerWidth: 200,textfont: 20,context:context,textfontabaixo: 9,selectedText:selectedText),
          separatorBuilder: (context, _) => const SizedBox(width: 12),
          itemCount: 2,
          scrollDirection: Axis.horizontal),
    );
  }
}
