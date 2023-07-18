import 'package:chefapp/features/perfil/perfil_controler/perfil_controler.dart';
import 'package:chefapp/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/error.dart';
import '../../../core/common/loader.dart';
import '../../../core/utils.dart';
import '../../receita/screen/receita_screen.dart';
import '../../auth/controleer/auth_controller.dart';
import 'package:routemaster/routemaster.dart';

import '../../receita/receitas_controller/receitas_controller.dart';

class UserProfileScreen extends ConsumerWidget {
  final String uid; // este uid vai nos dar o utilizador
  const UserProfileScreen({super.key, required this.uid});

  void navigateToUserEditeProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/editar-perfil/$uid');
  }

  void navigateToCriarReceita(BuildContext context) {
    Routemaster.of(context).push('/criarreceita');
  }

  void navigateToGuardadosPerfil(BuildContext context) {
    Routemaster.of(context).push('/perfilguardar');
  }

  void plusoneseguidor(WidgetRef ref, UserModel userausente) async {
    ref.read(perfilControllerProvider.notifier).plusoneseguidor(userausente);
  }

  void navigateToSeeSeguidores(BuildContext context) async {
    Routemaster.of(context).push('/seeSeguidores');
  }


  void navigateToASeguir(BuildContext context) async {
    Routemaster.of(context).push('/aSeguir');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userProvider)!.uid;
    return Scaffold(
      body: ref.watch(getUserDataProvider(uid)).when(
            data: (user) => NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: 250, //altura da appbar
                    floating: true,
                    snap: true,
                    flexibleSpace: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            user.banner,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding:
                                const EdgeInsets.all(20).copyWith(bottom: 70),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.profilePic),
                              radius: 45,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(20),
                          child: (userData == user.uid)
                              ? OutlinedButton(
                                  onPressed: () => {
                                    navigateToUserEditeProfile(
                                        context, user.uid)
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                  ),
                                  child: const Text('Editar Perfil'),
                                )
                              : (user.seguidores.contains(userData))
                                  ? OutlinedButton(
                                      onPressed: () => {
                                        plusoneseguidor(ref, user),
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                      ),
                                      child: const Text(
                                        'A Seguir',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    )
                                  : OutlinedButton(
                                      onPressed: () => {
                                        plusoneseguidor(ref, user),
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25),
                                      ),
                                      child: const Text(
                                        'Seguir',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                        ),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //
                              Text(
                                user.name,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .watch(getNumeroReceitasGuardadas(
                                              user.uid))
                                          .whenData((guardadosValue) {
                                        if (guardadosValue > 0) {
                                          navigateToGuardadosPerfil(context);
                                        } else {
                                          showSnackBar(context,
                                              "Precisa de Guardar alguma receita primeiro!");
                                        }
                                      });
                                    },
                                    child: userData == user.uid
                                        ? const Icon(
                                            Icons.bookmark,
                                            color: Colors.black,
                                            size: 30,
                                          )
                                        : const SizedBox(),
                                  ),
                                  const SizedBox(
                                      width: 10), // Espaçamento entre os botões
                                  GestureDetector(
                                    onTap: () {
                                      navigateToCriarReceita(context);
                                    },
                                    child: userData == user.uid
                                        ? const Icon(
                                            Icons.add,
                                            color: Colors.blue,
                                            size: 30,
                                          )
                                        : const SizedBox(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(user.descricao),
                          ),
                          const SizedBox(height: 10),
                          const Divider(thickness: 2),
                          //const  SizedBox(width: 50),
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              // Seguidores
                              GestureDetector(
                                onTap: () {
                                        navigateToSeeSeguidores(context);                       
                                },
                                child: const Text(
                                  'Seguidores:',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Text(user.seguidores.length.toString(),
                                  style: const TextStyle(fontSize: 15)),
                              const SizedBox(width: 50),

                              // A seguir
                              
                              GestureDetector(
                                onTap: () {
                                        navigateToASeguir(context);                       
                                },
                                child: const Text('A seguir:',
                                    style: TextStyle(fontSize: 15)),
                              ),
                              Text(user.aseguir.length.toString(),
                                  style: const TextStyle(fontSize: 15)),
                              const SizedBox(width: 60),
                              // Gostos
                              const Text('Posts:',
                                  style: TextStyle(fontSize: 15)),
                              ref.watch(getNumeroDeReceitasProvider(uid)).when(
                                    data: (numberpost) {
                                      return Text(numberpost.toString(),
                                          style: const TextStyle(fontSize: 15));
                                    },
                                    error: (error, stackTrace) {
                                      // print(error.toString());
                                      return ErrorText(error: error.toString());
                                    },
                                    loading: () => const SizedBox(),
                                  ),
                              //const   Text('0', style: TextStyle(fontSize: 15)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(thickness: 2),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: ref.watch(getUserReceitasProvider(uid)).when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final receita = data[index];
                          return ReceitaScreen(
                              receita: receita, usermodel: user, aux: true);
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      // print(error.toString());
                      return ErrorText(error: error.toString());
                    },
                    loading: () => const Loader(),
                  ),
            ),
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader(),
          ),
      // floatingActionButton: Visibility(
      //  visible: isSameUserProvider, // Defina a visibilidade do botão conforme necessário
      //  child: AnimatedOpacity(
      //   opacity: 1.0, // Defina a opacidade do botão conforme necessário
      //  duration: const Duration(milliseconds: 200),
      //  child: FloatingActionButton(
      //    onPressed: () => () {}, //navigateToAddRecipe(context),
      //     child: const Icon(Icons.add),
      //     ),
      //  ),
      // ),
      //  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
