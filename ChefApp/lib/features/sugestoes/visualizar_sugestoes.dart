import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/features/sugestoes/controller_sugestoes/controller_sugestoes.dart';

class VisualizarSugestao extends ConsumerWidget {
  const VisualizarSugestao({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 //   Future<UserModel?> _informacaodasugestao(SugestaoModel sugestao) async {
  //    final userSugestao = ref.read(getUserDataProvider(sugestao.uid)).asData?.value;
   //   return userSugestao;
   // }



    //UserModel usersugestao;
    //String uid= 'abs';
    //final userSugestao = ref.watch(getUserDataProvider(uid)).asData?.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar Sugestão'),
      ),
      body: ref.watch(allSugestoesProvider).when(
            data: (sugestoes) => ListView.builder(
              itemCount: sugestoes.length,
              itemBuilder: (context, index) {
                final sugestao = sugestoes[index];
                //final userSugestao =
                 //   ref.read(getUserDataProvider(sugestao.uid)).asData?.value;
                //print('USER Data');
                //print(userSugestao);
                return ListTile(
                  leading: InkWell(
                     onTap: () {
                  // Routemaster.of(context)
                  //    .push('/perfil/${userSugestao?.id}');
                     },
                      child: const CircleAvatar(
                  //  ba ckgroundImage: NetworkImage(
                  //    userSugestao?.profilePic ),
                    ),
                    ),
                  title: InkWell(
                    onTap: () {
                      //  Routemaster.of(context)
                      //     .push('/perfil/${userSugestao?.id}');
                    },
                    child: Text(sugestao.uid),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      text: sugestao.sugestaousuario,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.thumb_up),
                    onPressed: () {},
                  ),
                  // onTap: () {
                  //  Routemaster.of(context).push('/sugestoes/${sugestao.id}');
                  //},
                );
              },
            ),
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}
