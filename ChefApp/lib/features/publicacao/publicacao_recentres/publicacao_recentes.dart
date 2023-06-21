import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/error.dart';
import '../../../core/common/loader.dart';
import '../../auth/controleer/auth_controller.dart';
import '../../receita/receita_screen.dart';
import '../../receita/receitas_controller/receitas_controller.dart';

class PublicaoRecentes extends ConsumerWidget {
  const PublicaoRecentes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicações Recentes'),
      ),
      body: ref.watch(getAllReceitasProvider(ref)).when(
            data: (datareceita) {
              // return ref.watch(getUserDataProvider(datareceita.))
              return ListView.builder(
                itemCount: datareceita.length,
                itemBuilder: (BuildContext context, int index) {
                  final receita = datareceita[index];
                  return ref
                      .watch(getUserDataProvider(receita.uidusuario))
                      .when(
                    data: (user) {
                     return  ReceitaScreen(
                          receita: receita, usermodel: user, aux: true);
                    },
                    error: (error, stackTrace) {
              // print(error.toString());
              return ErrorText(error: error.toString());
            },
            loading: () => const Loader(),
                  );
                },
              );
            },
            error: (error, stackTrace) {
              // print(error.toString());
              return ErrorText(error: error.toString());
            },
            loading: () => const Loader(),
          ),
    );
  }
}