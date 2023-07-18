import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chefapp/core/failure.dart';
import 'package:chefapp/core/type_defs.dart';
import 'package:chefapp/models/usermodel.dart';
import '../../../core/providers/firebase_providers.dart';
import 'package:chefapp/core/constants/firebase_constants.dart';

import '../../../models/receita_model.dart';

final perfilRepositoryProvider = Provider((ref) {
  return PerfilRepository(firestore: ref.watch(firestoreProvider));
});

class PerfilRepository {
  final FirebaseFirestore _firestore;

  PerfilRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  // buscar a coleção dos users
  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
  CollectionReference get _receitas =>
      _firestore.collection(FirebaseConstants.receitasCollection);

  FutureVoid editProfile(UserModel user) async {
    try {
      return right(_users.doc(user.uid).update(user.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // Receitas para o User profile
  Stream<List<Receita>> getUserReceitas(String uid) {
    return _receitas
        .where('uidusuario', isEqualTo: uid)
        .orderBy('datacriacao', descending: true)
        .snapshots()
        .map(
          // converter para o receitas model
          (event) => event.docs
              .map((e) => Receita.fromMap(e.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  Stream<int> getNumeroDeReceitas(String uid) {
    return _receitas
        .where('uidusuario', isEqualTo: uid)
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  void plusoneseguidor(UserModel userpresente, UserModel userausente) async {
    if (userpresente.aseguir.contains(userausente.uid)) {
      _users.doc(userpresente.uid).update({
        'aseguir': FieldValue.arrayRemove([userausente.uid])
      });
      _users.doc(userausente.uid).update({
        'seguidores': FieldValue.arrayRemove([userpresente.uid])
      });
    } else {
      _users.doc(userpresente.uid).update({
        'aseguir': FieldValue.arrayUnion([userausente.uid])
      });
      _users.doc(userausente.uid).update({
        'seguidores': FieldValue.arrayUnion([userpresente.uid])
      });
    }
  }

  Stream<List<UserModel>> getAllUsers() {
    return _users
        .orderBy('dataUltimaReceita', descending: true)
        .snapshots()
        .map(
          // converter para o receitas model
          (event) => event.docs
              .map((e) => UserModel.fromMap(e.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  Stream<List<UserModel>> getAllUsersMaisSeguidores() {
    return _users.orderBy('seguidores', descending: true).snapshots().map(
          // converter para o receitas model
          (event) => event.docs
              .map((e) => UserModel.fromMap(e.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  Stream<List<String>> seeSeguidores(String uid) {
    return _users.doc(uid).snapshots().map((event) =>
        (event.data() as Map<String, dynamic>)['seguidores']?.cast<String>());
  }
  Stream<List<String>> seeaseguir(String uid) {
    return _users.doc(uid).snapshots().map((event) =>
        (event.data() as Map<String, dynamic>)['aseguir']?.cast<String>());
  }
  
}
