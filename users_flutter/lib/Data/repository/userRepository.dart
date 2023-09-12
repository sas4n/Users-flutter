import 'dart:convert';

import 'package:users_flutter/Data/dataResourse/users_Api_Call.dart';
import 'package:users_flutter/Data/model/user.dart';
import 'package:http/http.dart' as http;
import '../../domain/repository/repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserApiCall _userApiCall;

  UserRepositoryImp(this._userApiCall);
  @override
  Future<List<User>?> fetchAllUsers(int pageNr) async {
    final http.Response response = await _userApiCall.fetchAllUsers(pageNr);
    if (response.statusCode == 200) {
      final deserializedResponse = json.decode(response.body);
      final List<User> users = List<User>.from(
          deserializedResponse.map((user) => User.fromJson(user)));
      // print(users);
      return users;
    } else {
      print(response.body);
      return throw Exception('Something Went wrong, please refresh.');
    }
  }
}
