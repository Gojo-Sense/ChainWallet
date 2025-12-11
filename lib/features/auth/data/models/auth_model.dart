import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  final bool success;
  final AuthDataModel? data;
  final String? message;

  AuthResponseModel({
    required this.success,
    this.data,
    this.message,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

@JsonSerializable()
class AuthDataModel {
  final UserModel user;
  @JsonKey(name: 'accessToken')
  final String accessToken;
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  AuthDataModel({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataModelToJson(this);
}

@JsonSerializable()
class UserModel {
  final String id;
  final String email;

  UserModel({
    required this.id,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
    );
  }
}


