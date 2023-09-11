import 'package:users_flutter/domain/entity/user_entity.dart';

class User extends UserEntity {
  const User(
      {String? userId,
      String? userName,
      int? gender,
      String? dateOfBirth,
      String? municipality,
      String? province,
      String? pictureUrl})
      : super('', '', 0, '', '', '', '');

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        userId: map["userId"] ?? '',
        userName: map["userName"] ?? '',
        gender: map["gender"] ?? 0,
        dateOfBirth: map["dateOfBirth"] ?? '',
        municipality: map["municipality"] ?? '',
        province: map["province"] ?? '',
        pictureUrl: map["pictureUrl"] ?? '');
  }
}
