import 'package:chefapp/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/core/utils.dart';
import 'package:chefapp/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

// provider que contem informações do usuario e pode ser chamado em diferentes widgets 
final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController,bool>((ref) => AuthController(
      authRepository: ref.watch(authRepositoryProvider),
      ref: ref,
    ));


  // para saber se o usuario esta log in ou log out
  final authStateChangeProvider = StreamProvider((ref) {
    // ignore: non_constant_identifier_names
    final AuthController = ref.watch(authControllerProvider.notifier);
    return AuthController.authStateChange;
  });

  final getUserDataProvider = StreamProvider.family((ref, String uid) {
    // ignore: non_constant_identifier_names
    final AuthController = ref.watch(authControllerProvider.notifier);
    return AuthController.getuserData(uid);
  });

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository; // para ajudar no processo de autenticaçção 
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref, // aceder a outros providers
        super(false) // loading, para avisar que avisar que a autenticação nao esta em processo
  ;


  Stream<User?> get authStateChange => _authRepository.authStateChange; 

// funçao vinda do authrepository
// se der erro retornamos uma scaffold se der tudo correto retonramos o  usermodel
  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _authRepository.signInWithGoogle();
    state = false;
    user.fold(
        (l) => showSnackBar(context, l.message),
        // atualiza o userProvider com o novo valor do usuario 
        (userModel) => _ref 
            .read(userProvider.notifier)
            .update((state) => userModel)); // l -> failure r -> sucess
  }


  Stream<UserModel> getuserData(String uid){
    return _authRepository.getuserData(uid);
  }

  void logOut() async{
    _authRepository.logOut();
  }


}
