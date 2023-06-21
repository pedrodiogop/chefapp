

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SugestaoModel {
  final String uid;
  final String sugestaousuario;
  final List<String> likes;
  final String uidsugestao;
  SugestaoModel({
    required this.uid,
    required this.sugestaousuario,
    required this.likes,
    required this.uidsugestao,
  });


  SugestaoModel copyWith({
    String? uid,
    String? sugestaousuario,
    List<String>? likes,
    String? uidsugestao,
  }) {
    return SugestaoModel(
      uid: uid ?? this.uid,
      sugestaousuario: sugestaousuario ?? this.sugestaousuario,
      likes: likes ?? this.likes,
      uidsugestao: uidsugestao ?? this.uidsugestao,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'sugestaousuario': sugestaousuario,
      'likes': likes,
      'uidsugestao': uidsugestao,
    };
  }

  factory SugestaoModel.fromMap(Map<String, dynamic> map) {
    return SugestaoModel(
      uid: map['uid'] as String,
      sugestaousuario: map['sugestaousuario'] as String,
      likes: (map['likes'] as List<dynamic>).map((e) => e as String).toList(),
      uidsugestao: map['uidsugestao'] as String,
    );
  }

  @override
  String toString() {
    return 'SugestaoModel(uid: $uid, sugestaousuario: $sugestaousuario, likes: $likes, uidsugestao: $uidsugestao)';
  }

  @override
  bool operator ==(covariant SugestaoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.sugestaousuario == sugestaousuario &&
      listEquals(other.likes, likes) &&
      other.uidsugestao == uidsugestao;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      sugestaousuario.hashCode ^
      likes.hashCode ^
      uidsugestao.hashCode;
  }
}
