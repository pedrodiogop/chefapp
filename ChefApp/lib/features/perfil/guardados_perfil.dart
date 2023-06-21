import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:chefapp/features/receita/receitas_controller/receitas_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/core/common/loader.dart';
import 'package:chefapp/core/common/error.dart';

import '../receita/receita_screen.dart';

class GuardadosPerfil extends ConsumerWidget {
  //final List<String> guardados;
  const GuardadosPerfil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    //final receitaa = ref.read(getReceitaGuardadosProvider);
    //print('receita');
    //print(receitaa);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas Guardadas'),
      ),
      body: ref.watch(getReceitaGuardadosProvider(user.uid)).when(
            data: (data) {
              //  print(data);
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




//import 'package:chefapp/features/auth/controleer/auth_controller.dart';
//import 'package:chefapp/features/receita/receitas_controller/receitas_controller.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:chefapp/core/common/loader.dart';
//import 'package:chefapp/core/common/error.dart';
//
//import '../../models/teste.dart';
//import '../receita/receita_screen.dart';
//
//class GuardadosPerfil extends ConsumerWidget {
//  //final List<String> guardados;
//  const GuardadosPerfil({
//    Key? key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context, WidgetRef ref) {
//    final user = ref.watch(userProvider)!;
//    final receitaa = ref.read(getReceitaGuardadosProvider);
//    print('receita');
//    print(receitaa);
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Receitas Guardadas'),
//      ),
//      body: ref.watch(getReceitaGuardadosProvider).when(
//            data: (data) {
//              //  print(data);
//              return ListView.builder(
//                itemCount: data.length,
//                itemBuilder: (BuildContext context, int index) {
//                  final receita = data[index];
//                  return ref
//                      .watch(getUserDataProvider(receita.uidusuario))
//                      .when(
//                    data: (user)
//                    {
//                      ReceitaScreen(
//                          receita: receita, usermodel: user, aux: true);
//                    },
//                    error: (error, StackTrace) {
//                      return ErrorText(error: error.toString());
//                    },
//                    loading: () => const Loader(),
//                  );
//                },
//              );
//            },
//            error: (error, StackTrace) {
//              return ErrorText(error: error.toString());
//            },
//            loading: () => const Loader(),
//          ),
//    );
//  }
//}
