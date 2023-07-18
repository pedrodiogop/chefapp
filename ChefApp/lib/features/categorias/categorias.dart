import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/row_filtors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/error.dart';
import '../../core/common/loader.dart';
import '../../models/receitasparams_model.dart';
import '../auth/controleer/auth_controller.dart';
import '../receita/screen/receita_screen.dart';
import '../receita/receitas_controller/receitas_controller.dart';
import '../rowscrool/row_scrool_categorias.dart';





class Categorias extends ConsumerStatefulWidget {
   final int indexTipo;
  const Categorias({super.key,required this.indexTipo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriasState();
}

class _CategoriasState extends ConsumerState<Categorias> {

  int selectedPreco = 10000;
  int selectedTempo = 10000;
  int selectedCalorias = 10000;
  int selectedGostos = 0;
  String selectedTipo = '';

    void onFilterSelectedPreco(int filter) {
    setState(() {
      selectedPreco = filter;
    });
  }

  void onFilterSelectedTempo(int filter) {
    setState(() {
      selectedTempo = filter;
    });
  }

  void onFilterSelectedCalorias(int filter) {
    setState(() {
      selectedCalorias = filter;
    });
  }

  void onFilterSelectedGostos(int filter) {
    setState(() {
      selectedGostos = filter;
    });
  }

    void onFilterSelectedTIpo(String filter) {
    setState(() {
      selectedTipo = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: Column(children: [
        RowScroolCategorias(onFilterSelectedTIpo: onFilterSelectedTIpo, // função para retornar o nome do tipo da refeição
         indexTipo: widget.indexTipo), // variavel para usada para escrever "seleted"
        RowScroolFiltros(
          onFilterSelectedPreco: onFilterSelectedPreco,
          onFilterSelectedTempo: onFilterSelectedTempo,
          onFilterSelectedCalorias: onFilterSelectedCalorias,
          onFilterSelectedGostos: onFilterSelectedGostos,
        ),
        Expanded(
          child: ref
              .watch(getReceitasCategoriasProvider(ReceitasParams(
                  tipo: selectedTipo,
                  maxPreco: selectedPreco,
                  minLikes: selectedGostos,
                  maxCalorias: selectedCalorias,
                  maxtempo: selectedTempo)))
              .when(
                data: (datareceita) {
                  return ListView.builder(
                    itemCount: datareceita.length,
                    itemBuilder: (BuildContext context, int index) {
                      final receita = datareceita[index];
                      return ref
                          .watch(getUserDataProvider(receita.uidusuario))
                          .when(
                            data: (user) {
                              return ReceitaScreen(
                                  receita: receita, usermodel: user, aux: true);
                            },
                            error: (error, stackTrace) {
                              return ErrorText(error: error.toString());
                            },
                            loading: () => const Loader(),
                          );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return ErrorText(error: error.toString());
                },
                loading: () => const Loader(),
              ),
        ),
      ]),
    );
  }
}