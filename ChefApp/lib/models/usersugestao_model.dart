// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chefapp/models/sugestao_model.dart';
import 'package:chefapp/models/usermodel.dart';

class UserSugestaoModel {
  final SugestaoModel sugestaoModel;
  final UserModel? userModel;
  UserSugestaoModel({
    required this.sugestaoModel,
    required this.userModel,
  });

  UserSugestaoModel copyWith({
    SugestaoModel? sugestaoModel,
    UserModel? userModel,
  }) {
    return UserSugestaoModel(
      sugestaoModel: sugestaoModel ?? this.sugestaoModel,
      userModel: userModel ?? this.userModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sugestaoModel': sugestaoModel.toMap(),
      'userModel': userModel?.toMap(),
    };
  }

  factory UserSugestaoModel.fromMap(Map<String, dynamic> map) {
    return UserSugestaoModel(
      sugestaoModel: SugestaoModel.fromMap(map['sugestaoModel'] as Map<String,dynamic>),
      userModel: map['userModel'] != null ? UserModel.fromMap(map['userModel'] as Map<String,dynamic>) : null,
    );
  }

  @override
  String toString() => 'UserSugestaoModel(sugestaoModel: $sugestaoModel, userModel: $userModel)';

  @override
  bool operator ==(covariant UserSugestaoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.sugestaoModel == sugestaoModel &&
      other.userModel == userModel;
  }

  @override
  int get hashCode => sugestaoModel.hashCode ^ userModel.hashCode;
}
