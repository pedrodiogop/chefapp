import 'package:chefapp/features/perfil/perfil_controler/perfil_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/common/error.dart';
import '../../../core/common/loader.dart';
import '../../auth/controleer/auth_controller.dart';
import '../../chefs/chefs_retangulo.dart';
import '../../receita/receitas_controller/receitas_controller.dart';

class SeeSeguidores extends ConsumerWidget {
  const SeeSeguidores({super.key});
  void navigateToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/perfil/$uid');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useruid = ref.watch(userProvider)!.uid;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Seguidores'),
        ),
        body: ref.watch(getseeSeguidoresProvider(useruid)).when(
              data: (data) => ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    final uidSeguidor = data[index];
                 return  ref.watch(getUserDataProvider(uidSeguidor)).when(
                          data: (user) {
                            return Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer(
                      builder: (context, ref, _) {
                        final postCount = ref.watch(getNumeroDeReceitasProvider(user.uid)).asData?.value ?? 0;
                  final likeCount = ref.watch(getLikesUsuarioProvider(user.uid)).asData?.value ?? 0;
                       return  GestureDetector(
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
                          error: (error, stackTrace) {
                            // print(error.toString());
                            return ErrorText(error: error.toString());
                          },
                          loading: () => const SizedBox(),
                        );
                  }),
              error: (error, stackTrace) => ErrorText(error: error.toString()),
              loading: () => const Loader(),
            ));
  }
}
