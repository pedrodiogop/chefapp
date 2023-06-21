import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/error.dart';
import '../../../core/common/loader.dart';
import '../../auth/controleer/auth_controller.dart';
import '../../receita/receita_screen.dart';
import '../../receita/receitas_controller/receitas_controller.dart';

class PublicaoSeguidores extends ConsumerWidget {
  const PublicaoSeguidores({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useruid = ref.watch(userProvider)!;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Publicações dos a Seguir'),
        ),
        body: useruid.aseguir.isNotEmpty
            ? ref.watch(getAllReceitasaseguirProvider(useruid.uid)).when(
                  data: (datareceita) {
                    // return ref.watch(getUserDataProvider(datareceita.))
                    return ListView.builder(
                      itemCount: datareceita!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final receita = datareceita[index];
                        return ref
                            .watch(getUserDataProvider(receita.uidusuario))
                            .when(
                              data: (user) {
                                return ReceitaScreen(
                                    receita: receita,
                                    usermodel: user,
                                    aux: true);
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
                )
            : const Center(
              child: Text('Não segue ninguem!'),
            ));
  }
}
