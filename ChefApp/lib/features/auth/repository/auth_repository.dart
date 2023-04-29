import 'package:chefapp/core/constants/constants.dart';
import 'package:chefapp/core/type_defs.dart';
import 'package:chefapp/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chefapp/core/failure.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../../core/providers/firebase_providers.dart';



// este provider serve para usarmos funçoes da firebase, nao serve para guardar dados
final authRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider)));

class AuthRepository {
  // para serem usadas funções dos respetivos tipos
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;
        

  // retorna uma referencia a coleçao "users" que é usado para salvar informações do usuario 
  CollectionReference get _users => _firestore.collection(FirebaseConstants.usersCollection);

  // Future -> muito associado ao "async". 
  // Future -> Uma função que tenhas de esperar por um servidor ou um web 
  //Either(dependencia fpdart)  <String, UserModel> -> tipo do falhanço e tipo do sucesso
  FutureEither<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn(); // para o utilizador escolher a conta de autenticação
      //(print googleUser GoogleSignInAccount( displayName: "John Doe",email: "johndoe@gmail.com",id: "12345678901234567890",photoUrl: "https://lh3.googleusercontent.com/a-/AOh14GgC...",... // outros atributos))

      final googleAuth = await googleUser?.authentication; // estamos obtendo a informação da autenticação do usuario 

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential); // esta linha de codigo serve para registar ou fazer login de umutlizador 
      //print(userCredential.user?.email);

      // late -> para definir uma variavel e nao lhe darmos valor no momento que a definimos
      UserModel userModel;

      //verificar se ele é um novo user ou se ja existe
      // este trecho de codigo serve para guardar as informações na coleção "users"
      if(userCredential.additionalUserInfo!.isNewUser){ // FOI FEITO POR CAUSA DO KARMA
        userModel = UserModel( // dar valores as variaveis para serem guardadas na base de dados
          name: userCredential.user!.displayName ?? 'No Name',
          profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
          banner: Constants.bannerDefault,
          uid: userCredential.user!.uid,
          isAuthenticated: true
          );
          await _users.doc(userCredential.user!.uid).set(userModel.toMap()); // guardar as informações na coleçao 
      }else{
        // first -> vai nos dar o primeiro elemento da stream e transformar-lo para Future 
        userModel = await getuserData(userCredential.user!.uid).first;      }
      return right(userModel);
    } on FirebaseException catch(e){ // firebase excption 
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // usamo sum "stream" para qunado o user der refresh a app ver a pagina inicial e nao o login ...
  // para recolher as informaçoes do user da firebase 
  // esta função vai recolher dados do usuario sendo que cada vez que os dados do dusuario forem manipulados esta informação tambem
  // real time 
  Stream<UserModel> getuserData(String uid){
    // map -> converter o snapshot para um  Usermodel 
    return _users.doc(uid).snapshots().map((event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }
}
