import 'package:chefapp/core/constants/firebase_constants.dart';
import 'package:chefapp/core/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/providers/firebase_providers.dart';
import '../../../core/type_defs.dart';
import '../../../models/coment_model.dart';
import '../../../models/receita_model.dart';

final receitaRepositoryProvider = Provider((ref) {
  return ReceitaRepository(
    firestore: ref.watch(firestoreProvider),
  );
});

class ReceitaRepository {
  final FirebaseFirestore _firestore;

  ReceitaRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  CollectionReference get _receitas =>
      _firestore.collection(FirebaseConstants.receitasCollection);

  CollectionReference get _comments =>
      _firestore.collection(FirebaseConstants.commentsCollection);

  FutureVoid addReceita(Receita receita) async {
    try {
      await _users
          .doc(receita.uidusuario)
          .update({'dataUltimaReceita': DateTime.now().microsecondsSinceEpoch});
      return right(_receitas.doc(receita.id).set(receita.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid deleteReceita(Receita receita) async {
    try {
      return right(_receitas.doc(receita.id).delete());
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  void guardarReceita(Receita receita, String uid) async {
    if (receita.guardados.contains(uid)) {
      _receitas.doc(receita.id).update({
        'guardados': FieldValue.arrayRemove([uid])
      });
    } else {
      _receitas.doc(receita.id).update({
        'guardados': FieldValue.arrayUnion([uid])
      });
    }
  }

  void likeReceita(Receita receita, String uid) async {
    if (receita.likes.contains(uid)) {
      _receitas.doc(receita.id).update({
        'likes': FieldValue.arrayRemove([uid])
      });
    } else {
      _receitas.doc(receita.id).update({
        'likes': FieldValue.arrayUnion([uid])
      });
    }
  }

  // adiciona comentario e adiciona 1 na coleçao receita
  FutureVoid addComentario(Comentario comentario) async {
    try {
      await _comments.doc(comentario.id).set(comentario.toMap());
      return right(_receitas.doc(comentario.receitaid).update({
        'countcomentarios': FieldValue.increment(1),
      }));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<Receita> getReceitaByid(String receitaId) {
    return _receitas
        .doc(receitaId)
        .snapshots()
        .map((event) => Receita.fromMap(event.data() as Map<String, dynamic>));
  }

  Stream<List<Comentario>> getComentariosdaReceita(String receitaid) {
    return _comments
        .where('receitaid', isEqualTo: receitaid)
        .orderBy('datacriacao', descending: true)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => Comentario.fromMap(
                  e.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  Stream<List<Receita>> getReceitaGuardadosString(String userid) {
    return _receitas
        .where('guardados', arrayContains: userid)
        .orderBy('datacriacao', descending: true)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => Receita.fromMap(
                  e.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  Stream<int> getNumeroReceitasGuardadas(String userId) {
    return _receitas
        .where('guardados', arrayContains: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  Stream<List<Receita>> getAllReceitas() {
    return _receitas.orderBy('datacriacao', descending: true).snapshots().map(
          // converter para o receitas model
          (event) => event.docs
              .map((e) => Receita.fromMap(e.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  Stream<int> getLikesUsuario(String uid) {
    return _receitas
        .where('uidusuario', isEqualTo: uid)
        .snapshots()
        .map((event) {
      int totalLikes = 0;
      for (final doc in event.docs) {
        final data = doc.data() as Map<String,
            dynamic>?; // Cast to Map<String, dynamic> or the appropriate type
        final likesList = data?['likes']
            as List<dynamic>?; // Cast to List<dynamic> or the appropriate type
        if (likesList != null) {
          totalLikes += likesList.length;
        }
      }
      return totalLikes;
    });
  }

  Stream<List<Receita>> getReceitasRefeicao(
      String tipo, int maxPreco, int minLikes, int maxCalorias, int maxtempo) {
    return _receitas.where('refeicoes', arrayContains: tipo).snapshots().map(
          (event) => event.docs
              .map((e) => Receita.fromMap(e.data() as Map<String, dynamic>))
              .where((receita) {
            // print(receita);
            // Convertendo os campos para tipos numéricos
            final preco = int.tryParse(receita.preco);
            final calorias = int.tryParse(receita.calorias);
            final tempo = int.tryParse(receita.tempo);
            //print(maxPreco);
            //print('<');
            //print(preco);
            //print(receita.likes.length );
            //print('>=');
            //print(minLikes);
            // print(calorias);
            // print('>=');
            // print(maxCalorias);
            // Filtrando com os novos campos numéricos
            return preco != null &&
                calorias != null &&
                tempo != null &&
                tempo < maxtempo &&
                preco < maxPreco &&
                receita.likes.length >= minLikes &&
                calorias < maxCalorias;
          }).toList(),
        );
  }

    Stream<List<Receita>> getReceitasCategorias(
      String tipo, int maxPreco, int minLikes, int maxCalorias, int maxtempo) {
    return _receitas.where('categorias', arrayContains: tipo).snapshots().map(
          (event) => event.docs
              .map((e) => Receita.fromMap(e.data() as Map<String, dynamic>))
              .where((receita) {
            // print(receita);
            // Convertendo os campos para tipos numéricos
            final preco = int.tryParse(receita.preco);
            final calorias = int.tryParse(receita.calorias);
            final tempo = int.tryParse(receita.tempo);
            return preco != null &&
                calorias != null &&
                tempo != null &&
                tempo < maxtempo &&
                preco < maxPreco &&
                receita.likes.length >= minLikes &&
                calorias < maxCalorias;
          }).toList(),
        );
  }


  Stream<List<Receita>> getReceitaMaisLikes() {
    return _receitas.orderBy('likes', descending: true).snapshots().map(
          (event) => event.docs
              .map((e) => Receita.fromMap(e.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  Future<List<String>?> getSeguidores(String uid) async {
    final userSnapshot = await _users.doc(uid).get();
    List<String>? data =
        (userSnapshot.data() as Map<String, dynamic>)['seguidores'];
    return data;
  }

Stream<List<Receita>?> getAllReceitasaseguir(String uid) {
  return _users.doc(uid).snapshots().asyncMap((userSnapshot) async {
    List<String>? userSeguidores =
        (userSnapshot.data() as Map<String, dynamic>)['aseguir']
            ?.cast<String>();

    QuerySnapshot receitasSnapshot = await _receitas
        .orderBy('datacriacao', descending: true)
        .get();

    List<Receita> receitas = receitasSnapshot.docs
        .map((e) => Receita.fromMap(e.data() as Map<String, dynamic>))
        .toList();

    List<Receita> receitasSeguidores = receitas.where((receita) {
      return userSeguidores!.contains(receita.uidusuario);
    }).toList();

    return receitasSeguidores;
  });
}

}
