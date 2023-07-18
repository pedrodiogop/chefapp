import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolCategorias extends StatefulWidget {
  final void Function(String selectedFilter)? onFilterSelectedTIpo;
  final int indexTipo;
  const RowScroolCategorias({super.key, this.onFilterSelectedTIpo, required this.indexTipo});

  @override
  State<RowScroolCategorias> createState() => _RowScroolCategoriasState();
}

class _RowScroolCategoriasState extends State<RowScroolCategorias> {
  @override
  void initState() {
    super.initState();
    if (widget.indexTipo < 18) updateSelectedIndex(widget.indexTipo);
  }

String selectedText = '';
  List<CardItem> items = [
  CardItem(
    isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.gym,
      title: 'Gym',
      onTap: (context) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.vegan,
      title: 'Vegan',
      onTap: (context) {
},
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.carne,
      title: 'Carne',
      onTap: (context) {
       },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.peixe,
      title: 'Peixe',
      onTap: (context) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.arroz,
      title: 'Arroz',
      onTap: (context) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.massa,
      title: 'Massas',
      onTap: (context) {
     },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.fit,
      title: 'Fit',
      onTap: (context) {
     },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.legumes,
      title: 'Legumes',
      onTap: (context) {
    },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.salada,
      title: 'Salada',
      onTap: (context) {
  },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.pizza,
      title: 'Pizza',
      onTap: (context) {
     },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.gelados,
      title: 'Gelados',
      onTap: (context) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      
      text: '',
      image: Constants.gluten,
      title: 'Sem Gluten',
      onTap: (context) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.sushi,
      title: 'Sushi',
      onTap: (context) {
     },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.kebab,
      title: 'Kebab',
      onTap: (context) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.bolacha,
      title: 'Bolachas',
      onTap: (context) {
    },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.chocolate,
      title: 'Chocolate',
      onTap: (context) {
       },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.pao,
      title: 'Pão',
      onTap: (context) {
    },
    ),
      ];

  void updateSelectedIndex(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Quando queremos que ja esteja defino o tipo de refeiçao
      setState(() {
        for (int i = 0; i < items.length; i++) {
          if (i == index) {
            items[i].isSelected = true;
            widget.onFilterSelectedTIpo?.call(
                items[i].title); // Atualize o selectedTitle no widget Refeicoes
            // print(selectedTitle);
          } else {
            items[i].isSelected = false;
          }
        }
      });
    });
  }


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
          context: context,
          textfontabaixo: 9,
          selectedText: selectedText,
          onTap: () {
            updateSelectedIndex(index);
          },
          // isSelected: items[index].title == widget.selectedTitle,
        ),
        separatorBuilder: (context, _) => const SizedBox(width: 12),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}