import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
  int? userId;
  String? username;
  int? gender;
  String? dateOfBirth;
  String? municipality;
  String? province;
  String? pictureUrl;

  UserEntity({
    this.userId,
    this.username,
    this.gender,
    this.dateOfBirth,
    this.municipality,
    this.province,
    this.pictureUrl,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        gender,
        dateOfBirth,
        municipality,
        province,
        pictureUrl
      ];
}
