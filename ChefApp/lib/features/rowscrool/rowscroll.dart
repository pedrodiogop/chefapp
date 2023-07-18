import 'package:flutter/material.dart';

Widget buildCard({
  required CardItem items,
  required double containerWidth,
  required double textfont,
  double? textfontabaixo,
  required BuildContext context,
  void Function()? onTap,
  String? selectedText,
  String? selecionado, 
  bool? isSelected, // para o caso de ter sido selecionado (refeicoes e categorias)
}) {
  if (items.isTipo == false) { // CASO NÃO SEJA DOS WIDGETS REFEICAO E CATEGORIAS 
    return SizedBox(
      width: containerWidth,
      //height: 200,
      //color: Colors.red,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              // para as imagens terem todas o mesmo tamanho
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(30), // para teres a imagem circular
                child: Material(
                  child: Ink.image(
                    image: AssetImage(items.image),
                    fit: BoxFit.cover,
                    //height: 160,
                    child: InkWell(
                      onTap: () => items.onTap
                          ?.call(context), // adicionar nova wiget para navegar
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            items.title,
            style: TextStyle(fontSize: textfont, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            items.text!,
            style: TextStyle(
                fontSize: textfontabaixo, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  } else { // CASO SEJA DO TIPO REFEICAO E CATEGORIA
    return SizedBox(
      width: containerWidth,
      //height: 200,
      //color: Colors.red,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              // para as imagens terem todas o mesmo tamanho
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(30), // para teres a imagem circular
                child: Material(
                  child: Ink.image(
                    image: AssetImage(items.image),
                    fit: BoxFit.cover,
                    //height: 160,
                    child: InkWell(
                        onTap: onTap 
                        ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            items.title,
            style: TextStyle(fontSize: textfont, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          if (items.isSelected)
            Text(
              'Selecionado',
              style: TextStyle(
                  fontSize: textfontabaixo, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}

class CardItem {
  final String image; 
  final String title;
  final void Function(BuildContext context)? onTap;
  String? text; // representa o texto selecionado (para o caso dos filtros) 
  bool isSelected; // Para colocar "Selecionado" em baixo do card (para o caso "tipo de refeicao" e "categorias")
  bool isTipo; // para sabermos se estamos a tratar dos dados dos filtros ou das refeicoes e categorias

  CardItem({
    required this.image,
    required this.title,
    this.text,
    this.onTap,
    this.isSelected = false,
    this.isTipo = false,
  });
  }
