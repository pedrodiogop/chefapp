import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:chefapp/features/receita/receitas_controller/receitas_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/core/common/loader.dart';
import 'package:chefapp/core/common/error.dart';

import '../../receita/screen/receita_screen.dart';

class GuardadosPerfil extends ConsumerWidget {
  const GuardadosPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas Guardadas'),
      ),
      body: ref.watch(getReceitaGuardadosProvider(user.uid)).when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final receita = data[index];
                  return 
                    ReceitaScreen(
                       receita: receita, usermodel: user, aux: true);
                },
              );
            },
            error: (error, stackTrace) {
              return ErrorText(error: error.toString());
            },
            loading: () => const Loader(),
          ),
    );
  }
}