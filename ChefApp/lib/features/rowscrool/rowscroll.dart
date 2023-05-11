import 'package:flutter/material.dart';



Widget buildCard({
  required CardItem items,
  required double containerWidth,
  required double textfont,
}) =>
    Container(
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
                      onTap: items.onTap ,// adicionar nova wiget para navegar
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            items.title,
            style:  TextStyle(fontSize: textfont, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

class CardItem {
  final String image;
  final String title;
  void Function()? onTap;

   CardItem({
    required this.image,
    required this.title,
    required this.onTap,
  });
}