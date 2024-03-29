import 'package:chefapp/features/auth/screens/login_screen.dart';
import 'package:chefapp/firebase_options.dart';
import 'package:chefapp/theme/pallete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // ligar o flutter as plataformas android e ios
  await Firebase.initializeApp( // inicializa a firebase sdk 
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ProviderScope(child:  MyApp())); // para dar mos uso ao riverpod
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chef App',
      theme: Pallete.lightModeAppTheme, // cores da aplicaçao 
      home: const LoginScreen(), // para onde navega
    );
  }
}
