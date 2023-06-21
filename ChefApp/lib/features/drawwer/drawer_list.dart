//import 'package:chefapp/core/common/drawer_profile.dart';
import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:flutter/material.dart';   
import 'package:routemaster/routemaster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DrawerList extends ConsumerWidget{
  const DrawerList({Key? key}) : super(key: key);

  void logOut(WidgetRef ref){
    ref.read(authControllerProvider.notifier).logOut();
  }

  void navigateToHome(BuildContext context) {
    Routemaster.of(context).push('/');
  }
  
  void navigateToRefecoes(BuildContext context){
  Routemaster.of(context).push('/refeicoes');
}
void navigateToCategorias(BuildContext context){
  Routemaster.of(context).push('/categorias');
}
void navigateToChefs(BuildContext context){
  Routemaster.of(context).push('/chefs');
}
  void navigateToUserProfile(BuildContext context,String uid){
    Routemaster.of(context).push('/perfil/$uid');
  }
void navigateToEstatisticas(BuildContext context){
  Routemaster.of(context).push('/estatisticas');
}
void navigateToPublicacaoRecentes(BuildContext context){
  Routemaster.of(context).push('/publicacaorecentes');
}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            navigateToHome(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.dining),
          title: const Text('Refeições'),
          onTap: () {
            navigateToRefecoes(context);

          },
        ),
        ListTile(
          leading: const Icon(Icons.auto_awesome_motion_outlined),
          title: const Text('Categorias'),
          onTap: () {
            navigateToCategorias(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.assignment_ind_outlined),
          title: const Text('Chefs'),
          onTap: () {
            navigateToChefs(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.add_chart_rounded),
          title: const Text('Estatisticas'),
          onTap: () {
          },
        ),
        ListTile(
          leading: const Icon(Icons.ballot_outlined),
          title: const Text('Publicações'),
          onTap: () {
          },
        ),
        ListTile(
          leading: const Icon(Icons.ballot_outlined),
          title: const Text('Publicações Recentes'),
          onTap: () {
            navigateToPublicacaoRecentes(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: const Text('Perfil'),
          onTap: () {
            navigateToUserProfile(context, user.uid);
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Sugestão'),
          onTap: () {
            Routemaster.of(context).push('/sugestoes');
          },
        ),
        ListTile( 
          leading: const Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: () => logOut(ref),
        ),
        
      ],
    );
  }
}