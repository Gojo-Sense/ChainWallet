import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
sealed class UserEntity with _$UserEntity {
  const UserEntity._();
  
  const factory UserEntity({
    required String id,
    required String email,
  }) = _UserEntity;
}

