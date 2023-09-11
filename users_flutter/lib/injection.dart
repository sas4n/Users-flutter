import 'package:get_it/get_it.dart';
import 'package:users_flutter/Data/dataResourse/users_Api_Call.dart';
import 'package:users_flutter/Data/repository/userRepository.dart';
import 'package:users_flutter/domain/useCase/fetchDataUseCase.dart';

import 'core/useCase.dart';
import 'domain/repository/repository.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<UserApiCall>(UserApiCall());

  getIt.registerSingleton<UserRepository>(UserRepositoryImp(getIt()));

  getIt.registerSingleton<UseCase>(FetchDataUseCase(getIt()));
}
