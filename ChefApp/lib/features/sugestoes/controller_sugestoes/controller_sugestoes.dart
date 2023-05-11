import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:chefapp/features/sugestoes/repository_sugestoes/repository_sugestoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefapp/models/sugestao_model.dart';
import 'package:chefapp/core/utils.dart';
import 'package:routemaster/routemaster.dart';

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
    final uidutilizador = _ref.read(userProvider)?.uid ?? '';

    SugestaoModel sugestao = SugestaoModel(
        uid: uidutilizador, sugestaousuario: sugestaotexto, likes: 0);

    final res = await _sugestoesRepository.createSugestao(sugestao);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), 
    (r) {
      showSnackBar(context, "Sugestão enviada com sucesso!");
      Routemaster.of(context).pop; // mandar para a pagina de mostrar sugestoes
    });
  }

  Stream<List<SugestaoModel>> getAllSugestoes() {
    // final uid = _ref.read(userProvider)!.uid; //
    return _sugestoesRepository.getAllSugestoes();
  }
}
