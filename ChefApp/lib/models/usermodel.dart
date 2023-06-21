import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// Cmd+Shift+P
//import 'package:flutter/foundation.dart';

// final -> nao vao mudar de valor depois de serem associados
// estes sao os parametros do utilizador quando ele faz o registo, se quiseres adicionar mais parametros na coleçao "users" aumentas o numero de variaveis
class UserModel {
  final String name;
  final String profilePic;
  final String banner;
  final String uid;
  final bool isAuthenticated; // para verificar se é gest ou nao
  final String descricao;
  final List<String> aseguir;
  final List<String> seguidores;
  final DateTime? dataUltimaReceita;
  UserModel({
    required this.name,
    required this.profilePic,
    required this.banner,
    required this.uid,
    required this.isAuthenticated,
    required this.descricao,
    required this.aseguir,
    required this.seguidores,
    this.dataUltimaReceita,
  });

  UserModel copyWith({
    String? name,
    String? profilePic,
    String? banner,
    String? uid,
    bool? isAuthenticated,
    String? descricao,
    List<String>? aseguir,
    List<String>? seguidores,
    DateTime? dataUltimaReceita,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      banner: banner ?? this.banner,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      descricao: descricao ?? this.descricao,
      aseguir: aseguir ?? this.aseguir,
      seguidores: seguidores ?? this.seguidores,
      dataUltimaReceita: dataUltimaReceita ?? this.dataUltimaReceita,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'banner': banner,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
      'descricao': descricao,
      'aseguir': aseguir,
      'seguidores': seguidores,
      'dataUltimaReceita': dataUltimaReceita?.millisecondsSinceEpoch,
    };
  }


  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      banner: map['banner'] as String,
      uid: map['uid'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
      descricao: map['descricao'] as String,
      aseguir: (map['aseguir'] as List<dynamic>).cast<String>(),
      seguidores: (map['seguidores'] as List<dynamic>).cast<String>(),
      dataUltimaReceita: map['dataUltimaReceita'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dataUltimaReceita'] as int) : null,
    );
  }
  @override
  String toString() {
    return 'UserModel(name: $name, profilePic: $profilePic, banner: $banner, uid: $uid, isAuthenticated: $isAuthenticated, descricao: $descricao, aseguir: $aseguir, seguidores: $seguidores, dataUltimaReceita: $dataUltimaReceita)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.profilePic == profilePic &&
      other.banner == banner &&
      other.uid == uid &&
      other.isAuthenticated == isAuthenticated &&
      other.descricao == descricao &&
      listEquals(other.aseguir, aseguir) &&
      listEquals(other.seguidores, seguidores) &&
      other.dataUltimaReceita == dataUltimaReceita;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      profilePic.hashCode ^
      banner.hashCode ^
      uid.hashCode ^
      isAuthenticated.hashCode ^
      descricao.hashCode ^
      aseguir.hashCode ^
      seguidores.hashCode ^
      dataUltimaReceita.hashCode;
  }
}
