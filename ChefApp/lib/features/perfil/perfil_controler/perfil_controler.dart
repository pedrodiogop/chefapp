import 'dart:io';
import 'package:chefapp/core/providers/storage_repository_provider.dart';
import 'package:chefapp/models/receita_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/models/usermodel.dart';
import 'package:routemaster/routemaster.dart';
import 'package:chefapp/features/perfil/perfil_repository/perfil_repository.dart';
import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import '../../../core/utils.dart';



final perfilControllerProvider = StateNotifierProvider<PerfilController, bool>((ref) {
  final perfilRepository = ref.watch(perfilRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return PerfilController(
    perfilRepository: perfilRepository,
    storageRepository: storageRepository,
    ref: ref,
  );
});


final getUserReceitasProvider = StreamProvider.family((ref,String uid) {
  return ref.read(perfilControllerProvider.notifier).getUserReceitas(uid);
});


final getNumeroDeReceitasProvider = StreamProvider.family<int, String>((ref,String uid) {
  return ref.read(perfilControllerProvider.notifier).getNumeroDeReceitas(uid);
});

final getAllUsersProvider =
    StreamProvider.family((ref, _) {
  return ref.read(perfilControllerProvider.notifier).getAllUsers();
});



final getAllUsersMaisSeguidoresProvider =
    StreamProvider.family((ref, _) {
  return ref.read(perfilControllerProvider.notifier).getAllUsersMaisSeguidores();
});




class PerfilController extends StateNotifier<bool> {
  final PerfilRepository _perfilRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  PerfilController({
    required PerfilRepository perfilRepository,
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _perfilRepository = perfilRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void editProfile({
    required File? profileFile,
    required File? bannerFile,
    required BuildContext context,
    required String name,
    required String descricao,
  }) async {
    state = true;
    UserModel user = _ref.read(userProvider)!;
    if (profileFile != null) {
      final res = await _storageRepository.storeFile(
        path: 'user/profile',
        id: user.uid,
        file: profileFile,
      );
      res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => user = user.copyWith(profilePic: r),
      );
    }
    if (bannerFile != null) {
      // communities/banner/memes
      final res = await _storageRepository.storeFile(
        path: 'user/banner',
        id: user.uid,
        file: bannerFile,
      );
      res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => user = user.copyWith(banner: r),
      );
    }
    user = user.copyWith(name: name);
    user = user.copyWith(descricao: descricao);

    final res = await _perfilRepository.editProfile(user);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        // para o userProvider ter os mesmo dados que a firebase
        _ref.read(userProvider.notifier).update((state) => user); 
        Routemaster.of(context).pop();
      },
    );
  }

     void plusoneseguidor( UserModel userausente) async {
    final userpresente = _ref.read(userProvider)!;
    _perfilRepository.plusoneseguidor(userpresente, userausente);
  }


Stream<List<Receita>> getUserReceitas(String uid){
  return _perfilRepository.getUserReceitas(uid);
}

 Stream<int> getNumeroDeReceitas(String uid) {
    return _perfilRepository.getNumeroDeReceitas(uid);
  }

  Stream<List<UserModel>> getAllUsers() {
    return _perfilRepository.getAllUsers();
  }

  Stream<List<UserModel>> getAllUsersMaisSeguidores(){
    return _perfilRepository.getAllUsersMaisSeguidores();
  }

}
