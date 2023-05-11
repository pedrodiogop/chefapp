import 'package:flutter/material.dart';
//import 'package:chefapp/theme/pallete.dart';

 void displayDrawer(BuildContext context){
    Scaffold.of(context).openDrawer();
  }
  
class MyAppBar extends AppBar {
  MyAppBar(String title, {super.key})
      : super(
            title: Text(title),
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => displayDrawer(context),
                );
              }
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
             // CircleAvatar(backgroundImage: NetworkImage(user.profilePic),)
            ]
            // Outras propriedades da AppBar podem ser configuradas aqui
            );
}