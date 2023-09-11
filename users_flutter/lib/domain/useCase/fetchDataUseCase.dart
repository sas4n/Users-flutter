import 'package:users_flutter/core/useCase.dart';

import '../entity/user_entity.dart';
import '../repository/repository.dart';

class FetchDataUseCase implements UseCase<List<UserEntity>, int> {
  final Repository _repo;
  //int pageNr = 0;
  FetchDataUseCase(this._repo);
  @override
  Future<List<UserEntity>?> call(int pageNr) {
    return _repo.fetchAllUsers(pageNr);
  }
}
