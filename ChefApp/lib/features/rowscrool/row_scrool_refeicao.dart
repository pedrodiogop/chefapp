import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolRefeicao extends StatefulWidget {
  final void Function(String selectedFilter)? onFilterSelectedTIpo; // devolve o nome da refeicao selecionada
  final int indexTipo; // representa o indice do tipo refeicao selecionada 
  const RowScroolRefeicao(
      {super.key, this.onFilterSelectedTIpo, required this.indexTipo});

  @override
  State<RowScroolRefeicao> createState() => _RowScroolRefeicaoState();
}

class _RowScroolRefeicaoState extends State<RowScroolRefeicao> {

  
  // caso nao tenha clicado no text "refeicao"
  @override
  void initState() {
    super.initState();
    if (widget.indexTipo < 6) updateSelectedIndex(widget.indexTipo);
  }
  //


  // criacao dos CardItems, representam  as refeicoes
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
      image: Constants.lunch,
      title: 'Almoço/Jantar',
      onTap: (context) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.lanche,
      title: 'Lanche',
      onTap: (index) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.ceia,
      title: 'Ceia',
      onTap: (context) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.bebidas,
      title: 'Bebidas',
      onTap: (context) {
      },
    ),
    CardItem(
      isSelected: false,
      isTipo: true,
      text: '',
      image: Constants.sobremesa,
      title: 'Sobremesa',
      onTap: (context) {
      },
    ),
  ];

  ////

  // retorna o tipo de refeição selecionada para ao widget "refeicoes" 
  void updateSelectedIndex(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Quando queremos que ja esteja defino o tipo de refeiçao
      setState(() {
        for (int i = 0; i < items.length; i++) {
          if (i == index) {
            items[i].isSelected = true; // coloca o texto "selecionado" na refeição escolhida
            widget.onFilterSelectedTIpo?.call(
                items[i].title); // devolve o tipo de refeição  selecionada
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
        itemBuilder: (context, index) => buildCard( // construcao da linha 
          items: items[index],
          containerWidth: 200,
          textfont: 20,
          context: context,
          textfontabaixo: 9,
          selectedText: selectedText,
          onTap: () {
            updateSelectedIndex(index); // cada vez que outro tipo de refeicao seja selecionado a funcao é chamada
          },
        ),
        separatorBuilder: (context, _) => const SizedBox(width: 12),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
