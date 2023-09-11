import 'package:users_flutter/domain/entity/user_entity.dart';

class User extends UserEntity {
  User(
      {int? userId,
      String? username,
      int? gender,
      String? dateOfBirth,
      String? municipality,
      String? province,
      String? pictureUrl});

  User.fromJson(Map<String, dynamic> obj) {
    userId = obj['userId'] ?? 1;
    username = obj['username'] ?? '';
    gender = obj['gender'] ?? 1;
    dateOfBirth = obj['dateOfBirth'] ?? '';
    municipality = obj['municipality'] ?? '';
    province = obj['province'] ?? '';
    pictureUrl = obj['pictureUrl'] ?? '';
  }
}
