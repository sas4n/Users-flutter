import 'package:users_flutter/domain/entity/user_entity.dart';

abstract class Repository {
  Future<List<UserEntity>> fetchAllUsers(int pageNr);
}
