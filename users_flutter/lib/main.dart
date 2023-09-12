import 'package:flutter/material.dart';
import 'package:users_flutter/Data/dataResourse/users_Api_Call.dart';
import 'package:users_flutter/Data/repository/userRepository.dart';
import 'package:users_flutter/domain/repository/repository.dart';
import 'package:users_flutter/domain/useCase/fetchDataUseCase.dart';
import 'package:users_flutter/injection.dart';

import 'presentation/pages/usersPage.dart';

void main() async {
  setUp();
  //UserApiCall _userApiCall = UserApiCall();
  //UserRepository _repo = UserRepositoryImp(_userApiCall);
  //var s = FetchDataUseCase(_repo);
  //await s.call(0);
  runApp(const MyApp());
}

class MyApp extends MaterialApp {
  const MyApp({super.key}) : super(home: const UsersPage());
}
