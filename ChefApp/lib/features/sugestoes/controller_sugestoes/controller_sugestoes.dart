import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:chefapp/features/sugestoes/repository_sugestoes/repository_sugestoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/models/sugestao_model.dart';
import 'package:chefapp/core/utils.dart';
import 'package:routemaster/routemaster.dart';
import 'package:chefapp/models/usersugestao_model.dart';
import 'package:uuid/uuid.dart';


final allSugestoesProvider = StreamProvider((ref) {
  final sugestaoController = ref.watch(sugestaoControllerProvider.notifier);
  return sugestaoController.getAllSugestoes();
});

final sugestaoControllerProvider =
    StateNotifierProvider<SugestoesController, bool>((ref) {
  final sugestoesRepository = ref.watch(sugestaoReositoryProvider);
  return SugestoesController(
      sugestoesRepository: sugestoesRepository, ref: ref);
});

final userSugestaoProvider = StreamProvider<List<UserSugestaoModel>>((ref) {
  final sugestaoController = ref.watch(sugestaoControllerProvider.notifier);
  return sugestaoController.getUserSugestao(ref); 
});

//StateNotifier -> serve para a barra de login
class SugestoesController extends StateNotifier<bool> {
  final SugestoesRepository _sugestoesRepository;
  final Ref _ref; // para aceder ao user_provider
  SugestoesController(
      {required SugestoesRepository sugestoesRepository, required Ref ref})
      : _sugestoesRepository = sugestoesRepository,
        _ref = ref, // para aceder ao user_provider
        super(false); // loading false

  void createSugestao(String sugestaotexto, BuildContext context) async {
    state = true;
    final uidutilizador = _ref.read(userProvider)!.uid ;
String newDocId = const Uuid().v4();
    SugestaoModel sugestao = SugestaoModel(
        uid: uidutilizador, sugestaousuario: sugestaotexto, likes: [], uidsugestao: newDocId);

    final res = await _sugestoesRepository.createSugestao(sugestao);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), 
    (r) {
      showSnackBar(context, "Sugestão enviada com sucesso!");
      Routemaster.of(context).pop; // mandar para a pagina de mostrar sugestoes
    });
  }

  void deleteSugestao(UserSugestaoModel sugestao,BuildContext context) async {
    final res = await _sugestoesRepository.deleteSugestao(sugestao);
    res.fold((l) => null, (r) => showSnackBar(context, 'Receita eliminada'));
  }

  void likeSugestao(UserSugestaoModel sugestao,String uid) async {
    _sugestoesRepository.likeSugestao(sugestao, uid);
  }

  Stream<List<SugestaoModel>> getAllSugestoes() {
    return _sugestoesRepository.getAllSugestoes();
  }

    Stream<List<UserSugestaoModel>> getUserSugestao (Ref ref) {
    return _sugestoesRepository.getUserSugestao(ref);
  }
}
