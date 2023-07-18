// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:uuid/uuid.dart';
import 'package:chefapp/core/providers/storage_repository_provider.dart';
import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:chefapp/models/receita_model.dart';
import '../../../core/utils.dart';
import '../../../models/coment_model.dart';
import '../../../models/receitasparams_model.dart';
import '../receita_repository/receita_repository.dart';

final receitaControllerProvider =
    StateNotifierProvider<ReceitaController, bool>((ref) {
  final receitaRepository = ref.watch(receitaRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return ReceitaController(
      receitaRepository: receitaRepository,
      ref: ref,
      storageRepository: storageRepository);
});

final getrReceitaByIDProvider = StreamProvider.family((ref, String receitaId) {
  final postController = ref.watch(receitaControllerProvider.notifier);
  return postController.getReceitaByid(receitaId);
});

final getAllReceitasProvider =
    StreamProvider.family<List<Receita>, dynamic>((ref, _) {
  final postController = ref.watch(receitaControllerProvider.notifier);
  return postController.getAllReceitas();
});

final getReceitaComentariosProvider =
    StreamProvider.family((ref, String uireceita) {
  final receitaController = ref.watch(receitaControllerProvider.notifier);
  return receitaController.getComentariosdaReceita(uireceita);
});

final getReceitaGuardadosProvider = StreamProvider.family((ref, String userid) {
  final postController = ref.watch(receitaControllerProvider.notifier);
  return postController.getReceitaGuardadosString(userid);
});

final getNumeroReceitasGuardadas = StreamProvider.family((ref, String userid) {
  final postController = ref.watch(receitaControllerProvider.notifier);
  return postController.getNumeroReceitasGuardadas(userid);
});

final getLikesUsuarioProvider = StreamProvider.family((ref, String userid) {
  final postController = ref.watch(receitaControllerProvider.notifier);
  return postController.getLikesUsuario(userid);
});

final getReceitasRefeicaoProvider =
    StreamProvider.family<List<Receita>, ReceitasParams>(
        (ref, ReceitasParams params) {
  final postController = ref.watch(receitaControllerProvider.notifier);
  return postController.getReceitasRefeicao(params.tipo, params.maxPreco,
      params.minLikes, params.maxCalorias, params.maxtempo);
});

final getReceitasCategoriasProvider =
    StreamProvider.family<List<Receita>, ReceitasParams>(
        (ref, ReceitasParams params) {
  final postController = ref.watch(receitaControllerProvider.notifier);
  return postController.getReceitasCategorias(params.tipo, params.maxPreco, params.minLikes,
      params.maxCalorias, params.maxtempo);
});

final getReceitaMaisLikesProvider =
    StreamProvider.family<List<Receita>, dynamic>((ref, _) {
  final postController = ref.watch(receitaControllerProvider.notifier);
  return postController.getReceitaMaisLikes();
});

final getAllReceitasaseguirProvider =
    StreamProvider.family<List<Receita>?, String>((ref, String userid) {
  final postController = ref.watch(receitaControllerProvider.notifier);
  return postController.getAllReceitasaseguir(userid);
});

class ReceitaController extends StateNotifier<bool> {
  final ReceitaRepository _receitaRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  ReceitaController({
    required ReceitaRepository receitaRepository,
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _receitaRepository = receitaRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void addReceita({
    required BuildContext context, // para caso de erro
    required String name,
    required String tempo,
    required String calorias,
    required String preco,
    required List<String> refeicoes,
    required List<String> categorias,
    required String ingredientes,
    required String comofazer,
    required File image,
  }) async {
    state = true;
    String receitasId = const Uuid().v1();
    final user = _ref.read(userProvider)!;
    final imageRes = await _storageRepository.storeFile(
        path: 'receitas/image', id: receitasId, file: image);
    imageRes.fold((l) => showSnackBar(context, l.message), (r) async {
      final Receita receita = Receita(
        id: receitasId,
        name: name,
        uidusuario: user.uid,
        tempo: tempo,
        preco: preco,
        calorias: calorias,
        refeicoes: refeicoes,
        categorias: categorias,
        ingredientes: ingredientes,
        comofazer: comofazer,
        likes: [],
        guardados: [],
        datacriacao: DateTime.now(),
        countcomentarios: 0,
        image: r,
      );
      final res = await _receitaRepository.addReceita(receita);
      state = false;
      res.fold((l) => showSnackBar(context, l.message), (r) {
        showSnackBar(context, 'Receita Publicada com Sucesso!');
        Routemaster.of(context).pop();
      });
    });
  }

  void deleteReceita(Receita receita, BuildContext context) async {
    final res = await _receitaRepository.deleteReceita(receita);
    res.fold((l) => null, (r) => showSnackBar(context, 'Receita eliminada'));
  }

  void likeReceita(Receita receita) async {
    final uid = _ref.read(userProvider)!.uid;
    _receitaRepository.likeReceita(receita, uid);
  }

  void guardarReceita(Receita receita) async {
    final uid = _ref.read(userProvider)!.uid;
    _receitaRepository.guardarReceita(receita, uid);
  }

  Stream<Receita> getReceitaByid(String receitaId) {
    return _receitaRepository.getReceitaByid(receitaId);
  }

  void addComentario(
      {required BuildContext context,
      required String text,
      required String receitaid}) async {
    final id = const Uuid().v1();
    final uid = _ref.read(userProvider)!.uid;
    Comentario comentario = Comentario(
        id: id,
        texto: text,
        datacriacao: DateTime.now(),
        receitaid: receitaid,
        userid: uid);
    final res = await _receitaRepository.addComentario(comentario);
    res.fold((l) => showSnackBar(context, l.message), (r) => null);
  }

  Stream<List<Comentario>> getComentariosdaReceita(String uireceita) {
    return _receitaRepository.getComentariosdaReceita(uireceita);
  }

  Stream<List<Receita>> getAllReceitas() {
    return _receitaRepository.getAllReceitas();
  }

  Stream<List<Receita>> getReceitaGuardadosString(String userid) {
    // print('getReceitaGuardados - guardados: $guardados');
    return _receitaRepository.getReceitaGuardadosString(userid);
  }

  Stream<int> getNumeroReceitasGuardadas(String userid) {
    return _receitaRepository.getNumeroReceitasGuardadas(userid);
  }

  Stream<int> getLikesUsuario(String uid) {
    return _receitaRepository.getLikesUsuario(uid);
  }

  Stream<List<Receita>> getReceitasRefeicao(
      String tipo, int maxPreco, int minLikes, int maxCalorias, int maxtempo) {
    return _receitaRepository.getReceitasRefeicao(
        tipo, maxPreco, minLikes, maxCalorias, maxtempo);
  }

  Stream<List<Receita>> getReceitasCategorias(
      String tipo, int maxPreco, int minLikes, int maxCalorias, int maxtempo) {
    return _receitaRepository.getReceitasCategorias(
        tipo, maxPreco, minLikes, maxCalorias, maxtempo);
  }

  Stream<List<Receita>> getReceitaMaisLikes() {
    return _receitaRepository.getReceitaMaisLikes();
  }

  Stream<List<Receita>?> getAllReceitasaseguir(String uid) {
    return _receitaRepository.getAllReceitasaseguir(uid);
  }
}
