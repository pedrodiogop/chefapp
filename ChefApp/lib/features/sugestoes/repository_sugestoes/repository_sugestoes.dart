import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chefapp/core/type_defs.dart';
import 'package:chefapp/models/sugestao_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chefapp/core/failure.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../core/providers/firebase_providers.dart';
import 'package:uuid/uuid.dart';

final sugestaoReositoryProvider = Provider((ref) {
  return SugestoesRepository(firestore: ref.watch(firestoreProvider));
});

class SugestoesRepository {
  final FirebaseFirestore _firestore;
  SugestoesRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  // criar coleção sugestao com os dados que sao passados a variavel sugestao
  FutureVoid createSugestao(SugestaoModel sugestao) async {
    try {
      String newDocId = const Uuid().v4(); // ramdom DocId
      return right(_suggestion.doc(newDocId).set(sugestao.toMap()));
    } on FirebaseException catch (e) {
      throw left(Failure(e.toString()));
    }
  }

  //Função para dar dissplay as sugestões feitas por um user
  // Ainda nao esta totalmete correta
  Stream<List<SugestaoModel>> getindividualSugestoes(String uid){
    return _suggestion.where('uid',isEqualTo: uid).snapshots().map((event) {
      List<SugestaoModel> sugestao = [];
      for(var doc in event.docs){
        sugestao.add(SugestaoModel.fromMap(doc.data() as Map<String,dynamic>));
      }
      return sugestao;
    });
  }

  // todas as sugestoes 
  Stream<List<SugestaoModel>> getAllSugestoes(){
    return _suggestion.snapshots().map((event) {
      List<SugestaoModel> sugestao = [];
      for(var doc in event.docs){
        sugestao.add(SugestaoModel.fromMap(doc.data() as Map<String,dynamic>));
      }
      return sugestao;
    });
  } 



  // referencia a cleção que nos permite manipular os dados da firebase
  CollectionReference get _suggestion =>
      _firestore.collection(FirebaseConstants.sugestoesColletion);
}
