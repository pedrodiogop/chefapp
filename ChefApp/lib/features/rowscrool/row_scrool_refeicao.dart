import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolRefeicao extends StatefulWidget {
  final void Function(String selectedFilter)? onFilterSelectedTIpo;
  final int indexTipo;
  //final String? selectedTitle;
  const RowScroolRefeicao(
      {super.key, this.onFilterSelectedTIpo, required this.indexTipo});

  @override
  State<RowScroolRefeicao> createState() => _RowScroolRefeicaoState();
}

class _RowScroolRefeicaoState extends State<RowScroolRefeicao> {
  @override
  void initState() {
    super.initState();
    if (widget.indexTipo < 6) updateSelectedIndex(widget.indexTipo);
  }

  String selectedText = '';
  List<CardItem> items = [
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Pequeno Almoço',
      onTap: (context) {},
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Almoço/Jantar',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Lanche',
      onTap: (index) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Ceia',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Bebidas',
      onTap: (context) {
        // Navegar para um widget específico
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.pequenoalmoco,
      title: 'Sobremesa',
      onTap: (context) {
        // Navegar para um widget específico
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
