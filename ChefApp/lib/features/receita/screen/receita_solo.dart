import 'package:chefapp/core/common/error.dart';
import 'package:chefapp/core/common/loader.dart';
import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:chefapp/features/receita/screen/receita_screen.dart';
import 'package:chefapp/features/receita/receitas_controller/receitas_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/receita_model.dart';
import '../../coment/comentario_widget.dart';

class ReceitaSolo extends ConsumerStatefulWidget {
  final String idreceita;
  final String uid;
  const ReceitaSolo({super.key, required this.idreceita, required this.uid});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReceitaSoloState();
}

class _ReceitaSoloState extends ConsumerState<ReceitaSolo> {
  final commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

  void addComentario(Receita receita) {
    ref.read(receitaControllerProvider.notifier).addComentario(
        context: context,
        text: commentController.text.trim(),
        receitaid: receita.id);
    setState(() {
      commentController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receita'),
      ),
      body: SingleChildScrollView(
        child: ref.watch(getrReceitaByIDProvider(widget.idreceita)).when(
              data: (receita) {
                return ref.watch(getUserDataProvider(widget.uid)).when(
                      data: (userData) {
                        return Column(
                          children: [
                            ReceitaScreen(
                              receita: receita,
                              usermodel: userData,
                              aux: false,
                            ),
                            //SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Text(
                                        'Tempo',
                                        style: TextStyle(
                                            fontSize:
                                                18), // Tamanho do texto ajustado para 18
                                      ),
                                    ),
                                    Text(
                                      '${receita.tempo} min',
                                      style: const TextStyle(
                                          fontSize:
                                              18), // Tamanho do texto ajustado para 18
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Text(
                                        'Calorias',
                                        style: TextStyle(
                                            fontSize:
                                                18), // Tamanho do texto ajustado para 18
                                      ),
                                    ),
                                    Text(
                                      '${receita.calorias} kcal',
                                      style: const TextStyle(
                                          fontSize:
                                              18), // Tamanho do texto ajustado para 18
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(20.0),
                                      child: Text(
                                        'Preço',
                                        style: TextStyle(
                                            fontSize:
                                                18), // Tamanho do texto ajustado para 18
                                      ),
                                    ),
                                    Text(
                                      '${receita.preco} € ' ,
                                      style: const TextStyle(
                                          fontSize:
                                              18), // Tamanho do texto ajustado para 18
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Ingredientes',
                                      style: TextStyle(
                                          fontSize:
                                              20), // Tamanho do texto ajustado para 18
                                    ),
                                   const  SizedBox(height: 7,),
                                    Text(receita.ingredientes,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Instruções de preparo',
                                      style: TextStyle(
                                          fontSize:
                                              20), // Tamanho do texto ajustado para 18
                                    ),
                                    const  SizedBox(height: 7,),
                                    Text(receita.comofazer),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextField(
                              onSubmitted: (val) {
                                addComentario(receita);
                              },
                              controller: commentController,
                              decoration: const InputDecoration(
                                hintText: 'Comenta',
                                filled: true,
                                // border: InputBorder.none,
                              ),
                            ),
                            ref
                                .watch(getReceitaComentariosProvider(
                                    widget.idreceita))
                                .when(
                                    data: (data) {
                                      return SizedBox(
                                        height: 250,
                                        child: ListView.builder(
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final coment = data[index];
                                            return ComentarioWidget(
                                                user: userData,
                                                comentario: coment);
                                          },
                                          itemCount: data.length,
                                        ),
                                      );
                                    },
                                    error: (error, stackTrace) => ErrorText(
                                          error: error.toString(),
                                        ),
                                    loading: () => const Loader())
                          ],
                        );
                      },
                      error: (error, stackTrace) => ErrorText(
                        error: error.toString(),
                      ),
                      loading: () => const Loader(),
                    );
              },
              error: (error, stackTrace) => ErrorText(
                error: error.toString(),
              ),
              loading: () => const Loader(),
            ),
      ),
    );
  }
}
