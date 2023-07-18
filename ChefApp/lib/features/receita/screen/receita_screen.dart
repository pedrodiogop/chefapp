import 'package:chefapp/features/receita/receitas_controller/receitas_controller.dart';
import 'package:chefapp/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import '../../auth/controleer/auth_controller.dart';
import '../../../models/receita_model.dart';

class ReceitaScreen extends ConsumerWidget {
  final bool aux;
  final Receita receita;
  final UserModel usermodel;

  const ReceitaScreen(
      {super.key,
      required this.receita,
      required this.usermodel,
      required this.aux});

  void deleteReceita(WidgetRef ref, BuildContext context) async {
    ref
        .read(receitaControllerProvider.notifier)
        .deleteReceita(receita, context);
  }

  void likeReceita(WidgetRef ref) async {
    ref.read(receitaControllerProvider.notifier).likeReceita(receita);
  }

  void guardarReceita(WidgetRef ref) async {
    ref.read(receitaControllerProvider.notifier).guardarReceita(receita);
  }

  void navigateToUserProfile(BuildContext context, String uid) {
    Routemaster.of(context).push('/perfil/$uid');
  }

  void navigateToReceitaSolo(
      BuildContext context, String uid, String idreceita) {
    Routemaster.of(context).push('/receitasolo/$uid/$idreceita');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Column(
      children: [
        Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  // serve estarem entre o widget
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ).copyWith(right: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // dar um espaço entre os widgets
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        navigateToUserProfile(
                                            context, usermodel.uid);
                                      },
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(usermodel.profilePic),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              navigateToUserProfile(
                                                  context, usermodel.uid);
                                            },
                                            child: Text(
                                              usermodel.name,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          //   Text(
                                          //     'nome do ususario',
                                          //     style: const TextStyle(
                                          //       fontSize: 12,
                                          //     ),
                                          //   ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    if (receita.guardados.contains(user.uid))
                                      IconButton(
                                        onPressed: () {
                                          guardarReceita(ref);
                                        },
                                        icon: const Icon(
                                          Icons.bookmark_added,
                                        ),
                                      )
                                    else
                                      IconButton(
                                        onPressed: () {
                                          guardarReceita(ref);
                                        },
                                        icon: const Icon(
                                          Icons.bookmark_border_outlined,
                                        ),
                                      ),
                                    if (receita.uidusuario == user.uid)
                                      IconButton(
                                        onPressed: () {
                                          deleteReceita(ref, context);
                                        },
                                        icon: const Icon(Icons.delete,
                                            color: Colors.black),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: InkWell(
                                onTap: () {
                                  navigateToReceitaSolo(
                                              context, user.uid, receita.id);
                                },
                                child: Text(
                                  receita.name,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 0.92,
                              child: InkWell(
                                onTap: () {
                                 navigateToReceitaSolo(
                                              context, user.uid, receita.id);
                                },
                                child: Image.network(receita.image,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    if (receita.likes.contains(user.uid))
                                      IconButton(
                                        icon: const Icon(Icons.thumb_up_alt),
                                        onPressed: () {
                                          likeReceita(ref);
                                        },
                                      )
                                    else
                                      IconButton(
                                        icon: const Icon(
                                            Icons.thumb_up_alt_outlined),
                                        onPressed: () {
                                          likeReceita(ref);
                                        },
                                      ),
                                    Text(receita.likes.length.toString()),
                                    Visibility(
                                      visible: aux,
                                      child: IconButton(
                                        icon: const Icon(Icons.comment),
                                        onPressed: () {
                                          navigateToReceitaSolo(
                                              context, user.uid, receita.id);
                                        },
                                      ),
                                    ),
                                    Visibility(
                                      visible: aux,
                                      child: Text(
                                          receita.countcomentarios.toString()),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
