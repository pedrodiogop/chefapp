import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/row_scrool_refeicao.dart';
import 'package:chefapp/features/rowscrool/row_filtors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/error.dart';
import '../../core/common/loader.dart';
import '../auth/controleer/auth_controller.dart';
import '../receita/receita_screen.dart';
import '../receita/receitas_controller/receitas_controller.dart';

class Refeicoes extends ConsumerStatefulWidget {
  final int indexTipo;
  const Refeicoes({super.key, required this.indexTipo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RefeicoesState();
}

class _RefeicoesState extends ConsumerState<Refeicoes> {
  String selectedTitle = '';

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
    // print(selectedTipo);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refeições'),
      ),
      body: Column(children: [
        RowScroolRefeicao(onFilterSelectedTIpo: onFilterSelectedTIpo, indexTipo: widget.indexTipo),
        RowScroolFiltros(
          onFilterSelectedPreco: onFilterSelectedPreco,
          onFilterSelectedTempo: onFilterSelectedTempo,
          onFilterSelectedCalorias: onFilterSelectedCalorias,
          onFilterSelectedGostos: onFilterSelectedGostos,
        ),
        Expanded(
          child: ref
              .watch(getReceitasRefeicaoProvider(ReceitasParams(
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
