import 'package:chefapp/features/auth/controleer/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chefapp/core/type_defs.dart';
import 'package:chefapp/models/sugestao_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chefapp/core/failure.dart';
import '../../../core/constants/firebase_constants.dart';
import '../../../core/providers/firebase_providers.dart';
import 'package:chefapp/models/usersugestao_model.dart';
import 'package:chefapp/models/usermodel.dart';



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
       // ramdom DocId
      return right(_suggestion.doc(sugestao.uidsugestao).set(sugestao.toMap()));
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

//  Stream<List<UserSugestaoModel>> getUserSugestao(Ref ref){
//    return _suggestion.snapshots().map((event) {
//      List<UserSugestaoModel> usersugestao = [];
//      SugestaoModel sugestao = SugestaoModel(uid: '', sugestaousuario: '', likes: 0);
//      UserModel? user = UserModel(name: '', profilePic: '', banner: '', uid: '', isAuthenticated: true);
//      for(var doc in event.docs){
//        sugestao = SugestaoModel.fromMap(doc.data() as Map<String,dynamic>);
//        //ref.read(getUserDataProvider(sugestao.uid)).asData?.value
//        user =  ref.watch(getUserDataProvider(sugestao.uid)).asData?.value;
//        usersugestao.add(UserSugestaoModel(sugestaoModel: sugestao, userModel: user));
//        print(usersugestao);
//      }
//      return usersugestao;
//    });
//  }

  Stream<List<UserSugestaoModel>> getUserSugestao(Ref ref){
  return _suggestion.snapshots().asyncMap((event) async {
    List<UserSugestaoModel> usersugestao = [];
    SugestaoModel sugestao = SugestaoModel(uid: '', sugestaousuario: '', likes:[] ,uidsugestao: '');
    UserModel? user = UserModel(name: '', profilePic: '', banner: '', uid: '', isAuthenticated: true, descricao: '',aseguir: [],seguidores: []);
    for(var doc in event.docs){
      sugestao = SugestaoModel.fromMap(doc.data() as Map<String,dynamic>);
      user =  (await ref.watch(getUserDataProvider(sugestao.uid).future));
      usersugestao.add(UserSugestaoModel(sugestaoModel: sugestao, userModel: user));
      //print(usersugestao);
    }
    return usersugestao;
  });
}


  FutureVoid deleteSugestao(UserSugestaoModel sugestao) async {
    try {
      return right(_suggestion.doc(sugestao.sugestaoModel.uidsugestao).delete());
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  void likeSugestao(UserSugestaoModel sugestao, String uidutilizador) async {
    if (sugestao.sugestaoModel.likes.contains(uidutilizador)) {
      _suggestion.doc(sugestao.sugestaoModel.uidsugestao).update({
        'likes': FieldValue.arrayRemove([uidutilizador]),
      });
    } else {
      _suggestion.doc(sugestao.sugestaoModel.uidsugestao).update({
        'likes': FieldValue.arrayUnion([uidutilizador]),
      });
    }
  }





  // referencia a cleção que nos permite manipular os dados da firebase
  CollectionReference get _suggestion =>
      _firestore.collection(FirebaseConstants.sugestoesColletion);
}
