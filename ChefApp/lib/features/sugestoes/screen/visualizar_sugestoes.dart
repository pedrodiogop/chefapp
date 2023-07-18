import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/features/sugestoes/controller_sugestoes/controller_sugestoes.dart';
import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:routemaster/routemaster.dart';

import '../../../models/usersugestao_model.dart';

class VisualizarSugestao extends ConsumerWidget {
  const VisualizarSugestao({super.key});

  void navigateToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/perfil/$uid');
  }

  void deleteSugestao(
      WidgetRef ref, BuildContext context, UserSugestaoModel sugestao) async {
    ref
        .read(sugestaoControllerProvider.notifier)
        .deleteSugestao(sugestao, context);
  }

  void likeSSugestao(
      WidgetRef ref, UserSugestaoModel sugestao, String uid) async {
    ref.read(sugestaoControllerProvider.notifier).likeSugestao(sugestao, uid);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar Sugestão'),
      ),
      body: ref.watch(userSugestaoProvider).when(
            data: (sugestoes) => ListView.builder(
              itemCount: sugestoes.length,
              itemBuilder: (context, index) {
                final sugestao = sugestoes[index];
                return ListTile(
                  leading: InkWell(
                    onTap: () {
                      navigateToUserProfile(context, sugestao.userModel!.uid);
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(sugestao.userModel!.profilePic),
                    ),
                  ),
                  title: InkWell(
                    onTap: () {
                      //  Routemaster.of(context)
                      //     .push('/perfil/${userSugestao?.id}');
                    },
                    child: Text(sugestao.userModel!.name),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      text: sugestao.sugestaoModel.sugestaousuario,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: sugestao.userModel!.uid == user.uid
                            ? IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  deleteSugestao(ref, context, sugestao);
                                },
                              )
                            : null,
                      ),
                      sugestao.sugestaoModel.likes.contains(user.uid)
                          ? IconButton(
                              icon: const Icon(Icons.thumb_up),
                              onPressed: () {
                                likeSSugestao(ref, sugestao, user.uid);
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.thumb_up_alt_outlined),
                              onPressed: () {
                                likeSSugestao(ref, sugestao, user.uid);
                              },
                            ),
                      Text(
                        sugestao.sugestaoModel.likes.length.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
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
