import 'package:chefapp/core/constants/constants.dart';
import 'package:chefapp/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/constants/firebase_constants.dart';
import '../../../core/providers/firebase_providers.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider)));

class AuthRepository {
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
        
  CollectionReference get _users => _firestore.collection(FirebaseConstants.usersCollection);

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      //print(userCredential.user?.email);


      UserModel userModel;

      //verificar se ele é um novo user ou se ja existe
      if(userCredential.additionalUserInfo!.isNewUser){ // FOI FEITO POR CAUSA DO KARMA
        userModel = UserModel( // dar valores as variaveis para serem guardadas na base de dados
          name: userCredential.user!.displayName ?? 'No Name',
          profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
          banner: Constants.bannerDefault,
          uid: userCredential.user!.uid,
          isAuthenticated: true
          );
          await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      }
    } catch (e) {
      print(e);
    }
  }
}
