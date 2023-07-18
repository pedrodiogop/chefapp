class ReceitasParams {
  final String tipo;
  final int maxPreco;
  final int minLikes;
  final int maxCalorias;
  final int maxtempo;

  const ReceitasParams({
    required this.tipo,
    required this.maxPreco,
    required this.minLikes,
    required this.maxCalorias,
    required this.maxtempo,
  });

  ReceitasParams copyWith({
    String? tipo,
    int? maxPreco,
    int? minLikes,
    int? maxCalorias,
    int? maxtempo,
  }) {
    return ReceitasParams(
      tipo: tipo ?? this.tipo,
      maxPreco: maxPreco ?? this.maxPreco,
      minLikes: minLikes ?? this.minLikes,
      maxCalorias: maxCalorias ?? this.maxCalorias,
      maxtempo: maxtempo ?? this.maxtempo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tipo': tipo,
      'maxPreco': maxPreco,
      'minLikes': minLikes,
      'maxCalorias': maxCalorias,
      'maxtempo': maxtempo,
    };
  }

  factory ReceitasParams.fromMap(Map<String, dynamic> map) {
    return ReceitasParams(
      tipo: map['tipo'] as String,
      maxPreco: map['maxPreco'] as int,
      minLikes: map['minLikes'] as int,
      maxCalorias: map['maxCalorias'] as int,
      maxtempo: map['maxtempo'] as int,
    );
  }
  @override
  String toString() {
    return 'ReceitasParams(tipo: $tipo, maxPreco: $maxPreco, minLikes: $minLikes, maxCalorias: $maxCalorias, maxtempo: $maxtempo)';
  }

  @override
  bool operator ==(covariant ReceitasParams other) {
    if (identical(this, other)) return true;
  
    return 
      other.tipo == tipo &&
      other.maxPreco == maxPreco &&
      other.minLikes == minLikes &&
      other.maxCalorias == maxCalorias &&
      other.maxtempo == maxtempo;
  }

  @override
  int get hashCode {
    return tipo.hashCode ^
      maxPreco.hashCode ^
      minLikes.hashCode ^
      maxCalorias.hashCode ^
      maxtempo.hashCode;
  }
}
