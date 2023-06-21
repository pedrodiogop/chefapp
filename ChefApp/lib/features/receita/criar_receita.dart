import 'package:chefapp/features/receita/receitas_controller/receitas_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../../core/common/loader.dart';
import '../../core/utils.dart';

//////////////////////////////
//////////////////////////////

// widget para criar a lista de categorias e refeições
class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({super.key, required this.items});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedItems = [];

  void _itemchanged(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemchanged(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: _submit,
          child: const Text('Submeter'),
        ),
      ],
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////

class Criarreceita extends ConsumerStatefulWidget {
  const Criarreceita({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CriarreceitaState();
}

class _CriarreceitaState extends ConsumerState<Criarreceita> {
  final nomedareceitaController = TextEditingController();
  final caloriasdareceitaController = TextEditingController();
  final tempodareceitaController = TextEditingController();
  final precodareceitaController = TextEditingController();
  final ingredientesdareceitaController = TextEditingController();
  final comofazerdareceitaController = TextEditingController();
  List<String> _selectedItems = [];
  List<String> _selectedItemscategorias = [];
  File? imagemFile;

  bool get isFormValid =>
      nomedareceitaController.text.isNotEmpty &&
      caloriasdareceitaController.text.isNotEmpty &&
      tempodareceitaController.text.isNotEmpty &&
      precodareceitaController.text.isNotEmpty &&
      ingredientesdareceitaController.text.isNotEmpty &&
      comofazerdareceitaController.text.isNotEmpty &&
      _selectedItems.isNotEmpty &&
      _selectedItemscategorias.isNotEmpty &&
      imagemFile != null;

  void _showMultiSelect() async {
    final List<String> items = [
      'Pequeno-Almoço',
      'Almoço/Jantar',
      'Lanche',
      'Ceia',
      'Bebidas',
      'Sobremesa'
    ];
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  void _showMultiSelectCategorias() async {
    final List<String> items = [
      'Gym',
      'Vegan',
      'Carne',
      'Peixe',
      'Arroz',
      'Massas',
      'Fit',
      'Legumes',
      'Pizza',
      'Gelados',
      'Sem Gluten',
      'Sushi',
      'Kebab',
      'Bolachas'
          'Chocolate',
      'Pão',
    ];
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    if (results != null) {
      setState(() {
        _selectedItemscategorias = results;
      });
    }
  }

  void selectBannerImage() async {
    final res = await pickImage();
    if (res != null) {
      setState(() {
        imagemFile = File(res.files.first
            .path!); // tirar o caminho do ficheiro e criar um novo ficheiro
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    nomedareceitaController.dispose();
    caloriasdareceitaController.dispose();
    tempodareceitaController.dispose();
    precodareceitaController.dispose();
    ingredientesdareceitaController.dispose();
    comofazerdareceitaController.dispose();
  }

  void criarReceita() {
    ref.read(receitaControllerProvider.notifier).addReceita(
        context: context,
        name: nomedareceitaController.text.trim(),
        tempo: tempodareceitaController.text.trim(),
        preco: precodareceitaController.text.trim(),
        calorias: caloriasdareceitaController.text.trim(),
        refeicoes: _selectedItems,
        categorias: _selectedItemscategorias,
        ingredientes: ingredientesdareceitaController.text.trim(),
        comofazer: comofazerdareceitaController.text.trim(),
        image: imagemFile!);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =ref.watch(receitaControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Receita'),
        actions: [
          TextButton(
            onPressed: () {
              if (isFormValid) {
                criarReceita();
              } else {
                showSnackBar(context, 'Preencher Todos os Campos');
              }
            },
            child: const Text(
              'Guardar',
              style: TextStyle(
                color: Colors.white, // Defina a cor desejada aqui
              ),
            ),
          ),
        ],
      ),
      body: isLoading ? const Loader() : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              buildTextField('Nome da Receita', 'Nome da Receita',
                  nomedareceitaController, 1),
              const SizedBox(height: 10),
              buildTextField(
                  'Calorias', 'Calorias', caloriasdareceitaController, 1),
              const SizedBox(height: 10),
              buildTextField(
                  'Tempo', 'Tempo em Minutos', tempodareceitaController, 1),
                  buildTextField('Preco', 'Preço 10,54€', precodareceitaController, 1),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: _showMultiSelectCategorias,
                  child: const Text('Seleciona Categorias')),
              Wrap(
                children: _selectedItemscategorias
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: _showMultiSelect,
                  child: const Text('Seleciona Refeição')),
              Wrap(
                children: _selectedItems
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 10),
              buildTextField('Ingredientes', 'Ingredientes',
                  ingredientesdareceitaController, 3),
              const SizedBox(height: 10),
              buildTextField(
                  'Como Fazer', 'Como fazer ', comofazerdareceitaController, 5),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Escolha uma Image'),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: selectBannerImage,
                    child: DottedBorder(
                      radius: const Radius.circular(100),
                      dashPattern: const [
                        10,
                        4
                      ], // faz com que os ricos sejam maiores
                      strokeCap: StrokeCap.round,
                      borderType: BorderType.Rect,
                      child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: imagemFile != null
                              ? Image.file(imagemFile!)
                              : const Center(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 70,
                                  ),
                                )),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Visualizar Receita'),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

// funçao para chamar os textFields
Widget buildTextField(String nome, String nomedohint,
    TextEditingController controller, int tamanhoddelinha) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(nome),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: nomedohint,
          filled: true,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(18.0),
        ),
        minLines: tamanhoddelinha, // Define o número mínimo de linhas
        maxLines: null, // Define que o número de linhas é ilimitado
      ),
    ],
  );
}
