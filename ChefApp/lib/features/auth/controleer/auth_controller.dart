import 'package:chefapp/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/core/utils.dart';
import 'package:chefapp/models/usermodel.dart';

// provider que contem informações do usuario e pode ser chamado em diferentes widgets 
final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController,bool>((ref) => AuthController(
      authRepository: ref.watch(authRepositoryProvider),
      ref: ref,
    ));

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository; // para ajudar no processo de autenticaçção 
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref, // aceder a outros providers
        super(false) // loading, para avisar que avisar que a autenticação nao esta em processo
  ;

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
}
