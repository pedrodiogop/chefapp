// ignore_for_file: public_member_api_docs, sort_constructors_first


class Guardados {
  final String uidusuario;
  final String idreceita;
  final String countguardados;
  Guardados({
    required this.uidusuario,
    required this.idreceita,
    required this.countguardados,
  });
  

  Guardados copyWith({
    String? uidusuario,
    String? idreceita,
    String? countguardados,
  }) {
    return Guardados(
      uidusuario: uidusuario ?? this.uidusuario,
      idreceita: idreceita ?? this.idreceita,
      countguardados: countguardados ?? this.countguardados,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uidusuario': uidusuario,
      'idreceita': idreceita,
      'countguardados': countguardados,
    };
  }

  factory Guardados.fromMap(Map<String, dynamic> map) {
    return Guardados(
      uidusuario: map['uidusuario'] as String,
      idreceita: map['idreceita'] as String,
      countguardados: map['countguardados'] as String,
    );
  }

  @override
  String toString() => 'Guardados(uidusuario: $uidusuario, idreceita: $idreceita, countguardados: $countguardados)';

  @override
  bool operator ==(covariant Guardados other) {
    if (identical(this, other)) return true;
  
    return 
      other.uidusuario == uidusuario &&
      other.idreceita == idreceita &&
      other.countguardados == countguardados;
  }

  @override
  int get hashCode => uidusuario.hashCode ^ idreceita.hashCode ^ countguardados.hashCode;
}
