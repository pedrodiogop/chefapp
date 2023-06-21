import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chefapp/core/failure.dart';
import 'package:chefapp/core/providers/firebase_providers.dart';
import 'package:chefapp/core/type_defs.dart';

final storageRepositoryProvider = Provider(
  (ref) => StorageRepository(
    firebaseStorage: ref.watch(storageProvider),
  ),
);

class StorageRepository {
  final FirebaseStorage _firebaseStorage;

  StorageRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  //File? -> ? penso que so est apresente por causa da web parte
  //// path representa o caminho onde o arquivo será armazenado
  ///id representa o identificador único para o arquivo
  /// file próprio arquivo a ser armazenado
  FutureEither<String> storeFile(
      {required String path, required String id, required File? file}) async {
    try {
      final ref = _firebaseStorage
          .ref()
          .child(path)
          .child(id); // local ondo o arquivo sera armazenado
      UploadTask uploadTask = ref.putFile(file!);

      final snapshot = await uploadTask;
      return right(
          await snapshot.ref.getDownloadURL()); // URL de dowload do arquivo
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
