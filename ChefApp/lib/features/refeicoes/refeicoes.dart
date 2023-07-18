import 'package:flutter/material.dart';
import 'package:chefapp/features/rowscrool/row_scrool_refeicao.dart';
import 'package:chefapp/features/rowscrool/row_filtors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/error.dart';
import '../../core/common/loader.dart';
import '../../models/receitasparams_model.dart';
import '../auth/controleer/auth_controller.dart';
import '../receita/screen/receita_screen.dart';
import '../receita/receitas_controller/receitas_controller.dart';

class Refeicoes extends ConsumerStatefulWidget {
  final int
      indexTipo; // utilizado para determinar que tipo de refeição vai ser exibida
  const Refeicoes({super.key, required this.indexTipo});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RefeicoesState();
}

class _RefeicoesState extends ConsumerState<Refeicoes> {
  String selectedTitle = '';

  int selectedPreco = 10000; // representa o preço
  int selectedTempo = 10000; // representa o tempo
  int selectedCalorias = 10000; // representa as calorias
  int selectedGostos = 0; // representa os gostos
  String selectedTipo = ''; //representa o tipo de refeicao

  ///funcoes para guardar os dados escolhidos pelo utilizador

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

  ////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refeições'),
      ),
      body: Column(children: [
        RowScroolRefeicao( // Exibi o tipo de refeicoes
            onFilterSelectedTIpo:
                onFilterSelectedTIpo, // funcao para retornar o nome do tipo da refeicao seleciondo
            indexTipo:
                widget.indexTipo
                ), // variavel usada para escrever "seleted"
        RowScroolFiltros( // Exibe os filtros e devolve os valores selecionados 
          onFilterSelectedPreco: onFilterSelectedPreco,
          onFilterSelectedTempo: onFilterSelectedTempo,
          onFilterSelectedCalorias: onFilterSelectedCalorias,
          onFilterSelectedGostos: onFilterSelectedGostos,
        ),
        Expanded(
          child: ref
              .watch(getReceitasRefeicaoProvider(ReceitasParams( // busca as receitas a base de dados de acordo com os filtros
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
                          .watch(getUserDataProvider(receita.uidusuario)) // obtem os dados do utilizador responsavel pela receita
                          .when(
                            data: (user) {
                              return ReceitaScreen( // Exibe a receita juntamente com o utlizador
                                  receita: receita, usermodel: user, aux: true);
                            },
                            error: (error, stackTrace) {  // em caso de erro
                              return ErrorText(error: error.toString());
                            },
                            loading: () => const Loader(), // Exibido quando os dados ainda nao chegaram da base de dados
                          );
                    },
                  );
                },
                error: (error, stackTrace) { // caso de errro
                  return ErrorText(error: error.toString());
                },
                loading: () => const Loader(), // // Exibido quando os dados ainda nao chegaram da base de dados
              ),
        ),
      ]),
    );
  }
}
