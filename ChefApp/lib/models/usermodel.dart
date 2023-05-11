// ignore_for_file: public_member_api_docs, sort_constructors_first
// Cmd+Shift+P 
//import 'package:flutter/foundation.dart';


// final -> nao vao mudar de valor depois de serem associados
// estes sao os parametros do utilizador quando ele faz o registo, se quiseres adicionar mais parametros na coleçao "users" aumentas o numero de variaveis 
class UserModel {
  final String name;
  final String profilePic;
  final String banner; // nao sei o que é isto
  final String uid;
  final bool isAuthenticated; // para verificar se é gest ou nao  
  //final int karma; 
  //final List<String> awards;
  UserModel({
    required this.name,
    required this.profilePic,
    required this.banner,
    required this.uid,
    required this.isAuthenticated,
  });
  


  // userModel.name = ''; nao podemos fazer iso
  // UserModel.copyWith(name: 'name');
  UserModel copyWith({ // 
    String? name,
    String? profilePic,
    String? banner,
    String? uid,
    bool? isAuthenticated,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      banner: banner ?? this.banner,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'banner': banner,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      banner: map['banner'] as String,
      uid: map['uid'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, profilePic: $profilePic, banner: $banner, uid: $uid, isAuthenticated: $isAuthenticated)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.profilePic == profilePic &&
      other.banner == banner &&
      other.uid == uid &&
      other.isAuthenticated == isAuthenticated;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      profilePic.hashCode ^
      banner.hashCode ^
      uid.hashCode ^
      isAuthenticated.hashCode;
  }
}
