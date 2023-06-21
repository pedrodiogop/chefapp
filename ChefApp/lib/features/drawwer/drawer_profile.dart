import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:routemaster/routemaster.dart';



class DrawerProfile extends ConsumerWidget {
  const DrawerProfile({Key? key}) : super(key: key);

  void navigateToUserProfile(BuildContext context,String uid){
    Routemaster.of(context).push('/perfil/$uid');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return InkWell(
      onTap: () => navigateToUserProfile(context,user.uid),
      child: UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(user!.banner),
            fit: BoxFit.cover,
          ),
        ),
        accountName: Text(user.name),
        accountEmail: const Text(''),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(user.profilePic),
        ),
      ),
    );
  }
}