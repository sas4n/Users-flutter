import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String userName;
  final int gender;
  final String dateOfBirth;
  final String municipality;
  final String province;
  final String pictureUrl;

  const UserEntity(
    this.userId,
    this.userName,
    this.gender,
    this.dateOfBirth,
    this.municipality,
    this.province,
    this.pictureUrl,
  );

  @override
  List<Object?> get props => [
        userId,
        userName,
        gender,
        dateOfBirth,
        municipality,
        province,
        pictureUrl
      ];
}
