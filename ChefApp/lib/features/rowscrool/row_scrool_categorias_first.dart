import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';
import 'package:routemaster/routemaster.dart';

class RowScroolCategoriasFirst extends StatefulWidget {
  const RowScroolCategoriasFirst({super.key});

  @override
  State<RowScroolCategoriasFirst> createState() => _RowScroolCategoriasFirstState();
}

void navigateToCategoria(BuildContext context, int indexTipo) {
    Routemaster.of(context).push('/categorias/$indexTipo');
  }

void navigateToRefeicao(BuildContext context, int indexTipo) {
  Routemaster.of(context).push('/refeicoes/$indexTipo');
}

class _RowScroolCategoriasFirstState extends State<RowScroolCategoriasFirst> {
  List<CardItem> items = [
    CardItem(
     text: '',
       image: Constants.gym,
     title: 'Gym',
     onTap: (context) {
     navigateToCategoria(context, 0);
      },
     ),
    CardItem(
      text: '',
      image: Constants.vegan,
      title: 'Vegan',
      onTap: (context) {
navigateToCategoria(context,1);      },
    ),
    CardItem(
      text: '',
      image: Constants.carne,
      title: 'Carne',
      onTap: (context) {
navigateToCategoria(context,2);       },
    ),
    CardItem(
      text: '',
      image: Constants.peixe,
      title: 'Peixe',
      onTap: (context) {
navigateToCategoria(context,3);       },
    ),
    CardItem(
      text: '',
      image: Constants.arroz,
      title: 'Arroz',
      onTap: (context) {
navigateToCategoria(context,4);       },
    ),
    CardItem(
      text: '',
      image: Constants.massa,
      title: 'Massas',
      onTap: (context) {
navigateToCategoria(context,5);       },
    ),
    CardItem(
      text: '',
      image: Constants.fit,
      title: 'Fit',
      onTap: (context) {
navigateToCategoria(context,6);       },
    ),
    CardItem(
      text: '',
      image: Constants.legumes,
      title: 'Legumes',
      onTap: (context) {
navigateToCategoria(context,7);       },
    ),
    CardItem(
      text: '',
      image: Constants.salada,
      title: 'Salada',
      onTap: (context) {
navigateToCategoria(context,8);       },
    ),
    CardItem(
      text: '',
      image: Constants.pizza,
      title: 'Pizza',
      onTap: (context) {
navigateToCategoria(context,9);       },
    ),
    CardItem(
      text: '',
      image: Constants.gelados,
      title: 'Gelados',
      onTap: (context) {
navigateToCategoria(context,10);       },
    ),
    CardItem(
      text: '',
      image: Constants.gluten,
      title: 'Sem Gluten',
      onTap: (context) {
navigateToCategoria(context,11);       },
    ),
    CardItem(
      text: '',
      image: Constants.sushi,
      title: 'Sushi',
      onTap: (context) {
navigateToCategoria(context,12);       },
    ),
    CardItem(
      text: '',
      image: Constants.kebab,
      title: 'Kebab',
      onTap: (context) {
navigateToCategoria(context,13);       },
    ),
    CardItem(
      text: '',
      image: Constants.bolacha,
      title: 'Bolachas',
      onTap: (context) {
navigateToCategoria(context,14);       },
    ),
    CardItem(
      text: '',
      image: Constants.chocolate,
      title: 'Chocolate',
      onTap: (context) {
navigateToCategoria(context,15);       },
    ),
    CardItem(
      text: '',
      image: Constants.pao,
      title: 'Pão',
      onTap: (context) {
navigateToCategoria(context,16);       },
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
          itemCount: items.length,
          scrollDirection: Axis.horizontal),
    );
  }
}
