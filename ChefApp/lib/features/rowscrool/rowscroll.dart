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
  bool? isSelected,
}) {
  if (items.isTipo == false) {
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
  } else {
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
                        onTap: onTap // adicionar nova wiget para navegar
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
  // final String text;
  final void Function(BuildContext context)? onTap;
  // String selectedText; // Propriedade para o texto selecionado
  String? text;
  bool isSelected;
  bool isTipo;
  //void Function()? onTap;

  CardItem({
    required this.image,
    required this.title,
     this.text,
    this.onTap,
    this.isSelected = false,
    this.isTipo = false,
    //     required this.selectedText, // Adiciona a propriedade selectedText

    //required this.onTap,
  });

  // String get text => selectedText; // Retorna o valor de selectedText em text
}
