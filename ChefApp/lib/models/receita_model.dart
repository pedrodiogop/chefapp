import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Receita {
  final String id;
  final String name;
  final String uidusuario;
  final String tempo;
  final String calorias;
  final String preco;
  final List<String> refeicoes;
  final List<String> categorias;
  final String ingredientes;
  final String comofazer;
  final List<String> likes;
  final DateTime datacriacao;
  final int countcomentarios;
  final String image;
  final List<String> guardados;

  Receita({
    required this.id,
    required this.name,
    required this.uidusuario,
    required this.tempo,
    required this.calorias,
    required this.preco,
    required this.refeicoes,
    required this.categorias,
    required this.ingredientes,
    required this.comofazer,
    required this.likes,
    required this.datacriacao,
    required this.countcomentarios,
    required this.image,
    required this.guardados,
  });

  Receita copyWith({
    String? id,
    String? name,
    String? uidusuario,
    String? tempo,
    String? calorias,
    String? preco,
    List<String>? refeicoes,
    List<String>? categorias,
    String? ingredientes,
    String? comofazer,
    List<String>? likes,
    DateTime? datacriacao,
    int? countcomentarios,
    String? image,
    List<String>? guardados,
  }) {
    return Receita(
      id: id ?? this.id,
      name: name ?? this.name,
      uidusuario: uidusuario ?? this.uidusuario,
      tempo: tempo ?? this.tempo,
      calorias: calorias ?? this.calorias,
      preco: preco ?? this.preco,
      refeicoes: refeicoes ?? this.refeicoes,
      categorias: categorias ?? this.categorias,
      ingredientes: ingredientes ?? this.ingredientes,
      comofazer: comofazer ?? this.comofazer,
      likes: likes ?? this.likes,
      datacriacao: datacriacao ?? this.datacriacao,
      countcomentarios: countcomentarios ?? this.countcomentarios,
      image: image ?? this.image,
      guardados: guardados ?? this.guardados,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'uidusuario': uidusuario,
      'tempo': tempo,
      'calorias': calorias,
      'preco': preco,
      'refeicoes': refeicoes,
      'categorias': categorias,
      'ingredientes': ingredientes,
      'comofazer': comofazer,
      'likes': likes,
      'datacriacao': datacriacao.millisecondsSinceEpoch,
      'countcomentarios': countcomentarios,
      'image': image,
      'guardados': guardados,
    };
  }





  factory Receita.fromMap(Map<String, dynamic> map) {
    return Receita(
      id: map['id'] as String,
      name: map['name'] as String,
      uidusuario: map['uidusuario'] as String,
      tempo: map['tempo'] as String,
      calorias: map['calorias'] as String,
      preco: map['preco'] as String,
      refeicoes: (map['refeicoes'] as List<dynamic>).cast<String>(),
      categorias: (map['categorias'] as List<dynamic>).cast<String>(),
      ingredientes: map['ingredientes'] as String,
      comofazer: map['comofazer'] as String,
        likes: (map['likes'] as List<dynamic>).map((e) => e as String).toList(),
      datacriacao: DateTime.fromMillisecondsSinceEpoch(map['datacriacao'] as int),
      countcomentarios: map['countcomentarios'] as int,
      image: map['image'] as String,
      guardados: (map['guardados'] as List<dynamic>).cast<String>(),
    );
  }

  //  factory Receita.fromMap(Map<String, dynamic> map) {
  //  return Receita(
  //    id: map['id'] as String,
  //    name: map['name'] as String,
  //    uidusuario: map['uidusuario'] as String,
  //    tempo: map['tempo'] as String,
  //    calorias: map['calorias'] as String,
  //    refeicoes: List<String>.from(map['refeicoes'] as List<String>),
  //    categorias: List<String>.from(map['categorias'] as List<String>),
  //    ingredientes: map['ingredientes'] as String,
  //    comofazer: map['comofazer'] as String,
  //    likes: List<String>.from(map['likes'] as List<String>),
  //    datacriacao: DateTime.fromMillisecondsSinceEpoch(map['datacriacao'] as int),
  //    countcomentarios: map['countcomentarios'] as int,
  //    image: map['image'] as String,
  //  );
  //}

  @override
  String toString() {
    return 'Receita(id: $id, name: $name, uidusuario: $uidusuario, tempo: $tempo, calorias: $calorias, preco: $preco, refeicoes: $refeicoes, categorias: $categorias, ingredientes: $ingredientes, comofazer: $comofazer, likes: $likes, datacriacao: $datacriacao, countcomentarios: $countcomentarios, image: $image, guardados: $guardados)';
  }

  @override
  bool operator ==(covariant Receita other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.uidusuario == uidusuario &&
      other.tempo == tempo &&
      other.calorias == calorias &&
      other.preco == preco &&
      listEquals(other.refeicoes, refeicoes) &&
      listEquals(other.categorias, categorias) &&
      other.ingredientes == ingredientes &&
      other.comofazer == comofazer &&
      listEquals(other.likes, likes) &&
      other.datacriacao == datacriacao &&
      other.countcomentarios == countcomentarios &&
      other.image == image &&
      listEquals(other.guardados, guardados);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      uidusuario.hashCode ^
      tempo.hashCode ^
      calorias.hashCode ^
      preco.hashCode ^
      refeicoes.hashCode ^
      categorias.hashCode ^
      ingredientes.hashCode ^
      comofazer.hashCode ^
      likes.hashCode ^
      datacriacao.hashCode ^
      countcomentarios.hashCode ^
      image.hashCode ^
      guardados.hashCode;
  }


}
