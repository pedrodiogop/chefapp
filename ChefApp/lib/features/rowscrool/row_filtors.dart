import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolFiltros extends StatefulWidget {
  // devovem o numero selecionado para cada filtro 
  final void Function(int selectedFilter)? onFilterSelectedPreco;
  final void Function(int selectedFilter)? onFilterSelectedTempo;
    final void Function(int selectedFilter)? onFilterSelectedCalorias;
  final void Function(int selectedFilter)? onFilterSelectedGostos;
  //

  const RowScroolFiltros({Key? key, this.onFilterSelectedPreco,this.onFilterSelectedTempo,this.onFilterSelectedCalorias,this.onFilterSelectedGostos}) : super(key: key);

  @override
  State<RowScroolFiltros> createState() => _RowScroolFiltrosState();
}

class _RowScroolFiltrosState extends State<RowScroolFiltros> {
  late List<CardItem> items;
  String selectedText = '20';

  @override
  void initState() {
    super.initState();

    // criacao dos Card para representarem os filtros
    items = [
      CardItem(
        image: Constants.tempo,
        title: 'Tempo',
        text: 'Não selecionado',
        onTap: (context) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Indiferente'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[0].text = 'Indiferente'; 
                      });
                      widget.onFilterSelectedTempo?.call(10000000000000000);
                    },
                  ),
                  ListTile(
                    title: const Text('< 30 min'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[0].text = '< 30 min';
                      });
                     widget.onFilterSelectedTempo?.call(30);
                    },
                  ),
                  ListTile(
                    title: const Text('< 60 min'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[0].text = '< 60 min';
                      });
                      widget.onFilterSelectedTempo?.call(60);
                    },
                  ),
                  ListTile(
                    title: const Text('< 90 min'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[0].text = '< 90 min';
                      });
                      widget.onFilterSelectedTempo?.call(90);
                   },
                  ),
                  ListTile(
                    title: const Text('< 120 min'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[0].text = '< 120 min';
                      });
                     widget.onFilterSelectedTempo?.call(120);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      CardItem(
        image: Constants.calorias,
        title: 'Calorias',
        text: 'Não selecionado',
        onTap: (context) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Indiferente'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = 'Indiferente';
                      });
                   widget.onFilterSelectedCalorias?.call(10000000000000000);
                    },
                  ),
                  ListTile(
                    title: const Text('< 200 kcal'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = '< 200 kcal';
                      });
                      widget.onFilterSelectedCalorias?.call(200);
                    },
                  ),
                  ListTile(
                    title: const Text('< 400 kcal'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = '< 400 kcal';
                      });
                      widget.onFilterSelectedCalorias?.call(400);
                    },
                  ),
                  ListTile(
                    title: const Text('< 700 kcal'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = '< 700 kcal';
                      });
                     widget.onFilterSelectedCalorias?.call(700);
                    },
                  ),
                  ListTile(
                    title: const Text('< 1000 kcal'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = '< 1000 kcal';
                      });
                    widget.onFilterSelectedCalorias?.call(1000);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      CardItem(
        image: Constants.preco,
        title: 'Preço',
        text: 'Não selecionado',
        onTap: (context) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Indiferente'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = 'Indiferente';
                      });
                      widget.onFilterSelectedPreco?.call(10000000000000000);
                    },
                  ),
                  ListTile(
                    title: const Text('< 10€'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = '< 10€';
                      });
                      widget.onFilterSelectedPreco?.call(10);
                    },
                  ),
                  ListTile(
                    title: const Text('< 25€'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = '< 25€';
                      });
                      widget.onFilterSelectedPreco?.call(25);
                    },
                  ),
                  ListTile(
                    title: const Text('< 50€'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = '< 50€';
                      });
                      widget.onFilterSelectedPreco?.call(50);
                    },
                  ),
                  ListTile(
                    title: const Text('< 100€'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = '< 100€';
                      });
                      widget.onFilterSelectedPreco?.call(100);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
CardItem(
        image: Constants.like,
        title: 'Gostos',
        text: 'Não selecionado',
        onTap: (context) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Indiferente'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = 'Indiferente';
                      });
                    widget.onFilterSelectedGostos?.call(0);
                    },
                  ),
                  ListTile(
                    title: const Text('> 2 gostos'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = '> 2 gostos';
                      });
                      widget.onFilterSelectedGostos?.call(2);
                    },
                  ),
                  ListTile(
                    title: const Text('> 5 gostos'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = '> 5 gostos';
                      });
                      widget.onFilterSelectedGostos?.call(5);
                    },
                  ),
                  ListTile(
                    title: const Text('> 10 gostos'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = '> 10 gostos';
                      });
                     widget.onFilterSelectedGostos?.call(10);
                    },
                  ),
                  ListTile(
                    title: const Text('> 15 gostos'),
                    onTap: () {
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = '> 15 gostos';
                      });
                    widget.onFilterSelectedGostos?.call(15);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    ];
  }

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => buildCard(  // construcao da linha dos filtros
          items: items[index],
          containerWidth: 100,
          textfont: 13,
          context: context,
          textfontabaixo: 13,
          selectedText: selectedText,
        ),
        separatorBuilder: (context, _) => const SizedBox(width: 12),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
