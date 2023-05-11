import 'package:chefapp/core/common/loader.dart';
import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:chefapp/firebase_options.dart';
import 'package:chefapp/models/usermodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:chefapp/route.dart';
import 'package:chefapp/core/common/error.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // ligar o flutter as plataformas android e ios
  await Firebase.initializeApp(
    // inicializa a firebase sdk
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp())); // para dar mos uso ao riverpod
}


class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  UserModel? userModel;
     
  void getData(WidgetRef ref, User data) async{
    // getuserData -> serve para obter os dados de um usuario dado um uid
    userModel= await ref.watch(authControllerProvider.notifier).getuserData(data.uid).first;
    // userProvider vai ser atualizado com os dados do userModel
    ref.read(userProvider.notifier).update((state) => userModel);
    setState(() {
    });
  }
  

  @override
  Widget build(BuildContext context) {
    
    return ref.watch(authStateChangeProvider).when(
          data: (data) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Chef App',
            //theme: Pallete.lightModeAppTheme, // cores da aplicaçao
            routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) {
                if (data != null) {
                    getData(ref, data);
                    if(userModel != null){
                      return loggedInRoute;
                    }
                }
                return loggedOutRoute;
              },
            ),
            routeInformationParser: const RoutemasterParser(),
            //home: const LoginScreen(), // para onde navega
          ),
          error: (error, StackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }
}
