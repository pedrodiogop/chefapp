import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../core/common/error.dart';
import '../../core/common/loader.dart';
import '../chefs/chefs_retangulo.dart';
import '../perfil/perfil_controler/perfil_controler.dart';
import '../receita/receitas_controller/receitas_controller.dart';

class ChefsComMaisSeguidores extends ConsumerWidget {
  const ChefsComMaisSeguidores({Key? key}) : super(key: key);
  void navigateToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/perfil/$uid');
  }

//getNumeroDeReceitasProvider
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Dados do perfil (exemplo)
    //String profileImage = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chefs'),
      ),
      body: ref.watch(getAllUsersMaisSeguidoresProvider(ref)).when(
            data: (data) {
              data.sort(
                  (a, b) => b.seguidores.length.compareTo(a.seguidores.length));
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = data[index];
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer(
                          builder: (context, ref, _) {
                            final postCount = ref
                                    .watch(
                                        getNumeroDeReceitasProvider(user.uid))
                                    .asData
                                    ?.value ??
                                0;
                            final likeCount = ref
                                    .watch(getLikesUsuarioProvider(user.uid))
                                    .asData
                                    ?.value ??
                                0;
                            return GestureDetector(
                              onTap: () {
                                navigateToUserProfile(context, user.uid);
                              },
                              child: RetanguloInfoChef(
                                banner: user.banner,
                                profileImage: user.profilePic,
                                name: user.name,
                                description: user.descricao,
                                postCount: postCount,
                                likeCount: likeCount,
                                followerCount: user.seguidores.length,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
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
