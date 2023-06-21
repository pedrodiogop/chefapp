// ignore_for_file: public_member_api_docs, sort_constructors_first

class Comentario {
  final String id;
  final String texto;
  final DateTime datacriacao;
  final String receitaid;
  final String userid;
  Comentario({
    required this.id,
    required this.texto,
    required this.datacriacao,
    required this.receitaid,
    required this.userid,
  });

  Comentario copyWith({
    String? id,
    String? texto,
    DateTime? datacriacao,
    String? receitaid,
    String? userid,
  }) {
    return Comentario(
      id: id ?? this.id,
      texto: texto ?? this.texto,
      datacriacao: datacriacao ?? this.datacriacao,
      receitaid: receitaid ?? this.receitaid,
      userid: userid ?? this.userid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'texto': texto,
      'datacriacao': datacriacao.millisecondsSinceEpoch,
      'receitaid': receitaid,
      'userid': userid,
    };
  }

  factory Comentario.fromMap(Map<String, dynamic> map) {
    return Comentario(
      id: map['id'] as String,
      texto: map['texto'] as String,
      datacriacao: DateTime.fromMillisecondsSinceEpoch(map['datacriacao'] as int),
      receitaid: map['receitaid'] as String,
      userid: map['userid'] as String,
    );
  }


  @override
  String toString() {
    return 'Comentario(id: $id, texto: $texto, datacriacao: $datacriacao, receitaid: $receitaid, userid: $userid)';
  }

  @override
  bool operator ==(covariant Comentario other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.texto == texto &&
      other.datacriacao == datacriacao &&
      other.receitaid == receitaid &&
      other.userid == userid;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      texto.hashCode ^
      datacriacao.hashCode ^
      receitaid.hashCode ^
      userid.hashCode;
  }
}
