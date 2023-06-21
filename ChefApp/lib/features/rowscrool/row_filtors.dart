import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/rowscroll.dart';
import 'package:chefapp/core/constants/constants.dart';

class RowScroolFiltros extends StatefulWidget {
  final void Function(int selectedFilter)? onFilterSelectedPreco;
  final void Function(int selectedFilter)? onFilterSelectedTempo;
    final void Function(int selectedFilter)? onFilterSelectedCalorias;

  final void Function(int selectedFilter)? onFilterSelectedGostos;

  const RowScroolFiltros({Key? key, this.onFilterSelectedPreco,this.onFilterSelectedTempo,this.onFilterSelectedCalorias,this.onFilterSelectedGostos}) : super(key: key);

  @override
  State<RowScroolFiltros> createState() => _RowScroolFiltrosState();
}

class _RowScroolFiltrosState extends State<RowScroolFiltros> {
  late List<CardItem> items;
  String selectedText = '20'; // New property to store the selected value

  @override
  void initState() {
    super.initState();

    items = [
      CardItem(
        image: Constants.pequenoalmoco,
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
                      // Opção "Indiferente" selecionada
                      // Faça alguma coisa
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
                      // Opção "< 5 min" selecionada
                      // Faça alguma coisa
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
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
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
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
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
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[0].text = '< 120 min';
                      });
                     widget.onFilterSelectedTempo?.call(120);
                    },
                  ),
                  // Adicione mais opções de tempo aqui
                ],
              );
            },
          );
        },
      ),
      CardItem(
        image: Constants.pequenoalmoco,
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
                      // Opção "Indiferente" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = 'Indiferente';
                      });
                   widget.onFilterSelectedCalorias?.call(10000000000000000);
                    },
                  ),
                  ListTile(
                    title: const Text('< 30 min'),
                    onTap: () {
                      // Opção "< 5 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = '< 30 min';
                      });
                      widget.onFilterSelectedCalorias?.call(30);
                    },
                  ),
                  ListTile(
                    title: const Text('< 60 min'),
                    onTap: () {
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = '< 60 min';
                      });
                      widget.onFilterSelectedCalorias?.call(60);
                    },
                  ),
                  ListTile(
                    title: const Text('< 90 min'),
                    onTap: () {
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = '< 90 min';
                      });
                     widget.onFilterSelectedCalorias?.call(90);
                    },
                  ),
                  ListTile(
                    title: const Text('< 120 min'),
                    onTap: () {
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[1].text = '< 120 min';
                      });
                    widget.onFilterSelectedCalorias?.call(120);
                    },
                  ),
                  // Adicione mais opções de tempo aqui
                ],
              );
            },
          );
        },
      ),
      CardItem(
        image: Constants.pequenoalmoco,
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
                      // Opção "Indiferente" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = 'Indiferente';
                      });
                      widget.onFilterSelectedPreco?.call(10000000000000000);
                    },
                  ),
                  ListTile(
                    title: const Text('< 30 min'),
                    onTap: () {
                      // Opção "< 5 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = '< 30 min';
                      });
                      widget.onFilterSelectedPreco?.call(30);
                    },
                  ),
                  ListTile(
                    title: const Text('< 60 min'),
                    onTap: () {
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = '< 60 min';
                      });
                      widget.onFilterSelectedPreco?.call(60);
                    },
                  ),
                  ListTile(
                    title: const Text('< 90 min'),
                    onTap: () {
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = '< 90 min';
                      });
                      widget.onFilterSelectedPreco?.call(90);
                    },
                  ),
                  ListTile(
                    title: const Text('< 120 min'),
                    onTap: () {
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[2].text = '< 120 min';
                      });
                      widget.onFilterSelectedPreco?.call(120);
                    },
                  ),
                  // Adicione mais opções de tempo aqui
                ],
              );
            },
          );
        },
      ),
CardItem(
        image: Constants.pequenoalmoco,
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
                      // Opção "Indiferente" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = 'Indiferente';
                      });
                    widget.onFilterSelectedGostos?.call(0);
                    },
                  ),
                  ListTile(
                    title: const Text('< 30 min'),
                    onTap: () {
                      // Opção "< 5 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = '< 30 min';
                      });
                      widget.onFilterSelectedGostos?.call(30);
                    },
                  ),
                  ListTile(
                    title: const Text('< 60 min'),
                    onTap: () {
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = '< 60 min';
                      });
                      widget.onFilterSelectedGostos?.call(60);
                    },
                  ),
                  ListTile(
                    title: const Text('< 90 min'),
                    onTap: () {
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = '< 90 min';
                      });
                     widget.onFilterSelectedGostos?.call(90);
                    },
                  ),
                  ListTile(
                    title: const Text('< 120 min'),
                    onTap: () {
                      // Opção "< 10 min" selecionada
                      // Faça alguma coisa
                      Navigator.pop(context); // Feche o modal
                      setState(() {
                        items[3].text = '< 120 min';
                      });
                    widget.onFilterSelectedGostos?.call(120);
                    },
                  ),
                  // Adicione mais opções de tempo aqui
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
        itemBuilder: (context, index) => buildCard(
          items: items[index],
          containerWidth: 100,
          textfont: 13,
          context: context,
          textfontabaixo: 13,
          selectedText: selectedText, // Passa o valor de selectedText

          //  onTap: () {
          //   items[index].onTap(context);
          // },
        ),
        separatorBuilder: (context, _) => const SizedBox(width: 12),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
