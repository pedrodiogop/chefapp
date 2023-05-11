// ignore_for_file: public_member_api_docs, sort_constructors_first
class SugestaoModel {
  final String uid;
  final String sugestaousuario;
  final int likes;
  SugestaoModel({
    required this.uid,
    required this.sugestaousuario,
    required this.likes,
  });


  SugestaoModel copyWith({
    String? uid,
    String? sugestaousuario,
    int? likes,
  }) {
    return SugestaoModel(
      uid: uid ?? this.uid,
      sugestaousuario: sugestaousuario ?? this.sugestaousuario,
      likes: likes ?? this.likes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'sugestaousuario': sugestaousuario,
      'likes': likes,
    };
  }

  factory SugestaoModel.fromMap(Map<String, dynamic> map) {
    return SugestaoModel(
      uid: map['uid'] as String,
      sugestaousuario: map['sugestaousuario'] as String,
      likes: map['likes'] as int,
    );
  }

  @override
  String toString() => 'SugestaoModel(uid: $uid, sugestaousuario: $sugestaousuario, likes: $likes)';

  @override
  bool operator ==(covariant SugestaoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.sugestaousuario == sugestaousuario &&
      other.likes == likes;
  }

  @override
  int get hashCode => uid.hashCode ^ sugestaousuario.hashCode ^ likes.hashCode;
}
