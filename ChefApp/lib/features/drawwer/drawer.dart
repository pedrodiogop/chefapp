import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/features/drawwer/drawer_profile.dart';
import 'package:chefapp/features/drawwer/drawer_list.dart';


class Drawwer extends StatelessWidget {
  const Drawwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
           DrawerProfile(),
           SizedBox(height: 8),
          Expanded(
            child: DrawerList(),
          ),
        ],
      )),
    );
  }
}
