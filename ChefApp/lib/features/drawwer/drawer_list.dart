//import 'package:chefapp/core/common/drawer_profile.dart';
import 'package:flutter/material.dart';   
import 'package:routemaster/routemaster.dart';


class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Routemaster.of(context).push('/');
          },
        ),
        ListTile(
          leading: const Icon(Icons.dining),
          title: const Text('Refeições'),
          onTap: () {
          },
        ),
        ListTile(
          leading: const Icon(Icons.auto_awesome_motion_outlined),
          title: const Text('Categorias'),
          onTap: () {
          },
        ),
        ListTile(
          leading: const Icon(Icons.assignment_ind_outlined),
          title: const Text('Chefs'),
          onTap: () {
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
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_circle_outlined),
          title: const Text('Perfil'),
          onTap: () {
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
          onTap: () {
          },
        ),
        
      ],
    );
  }
}