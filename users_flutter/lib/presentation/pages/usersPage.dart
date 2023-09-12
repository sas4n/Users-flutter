import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:users_flutter/core/useCase.dart';
import 'package:users_flutter/domain/useCase/fetchDataUseCase.dart';

import '../../injection.dart';
import '../bloc/users_bloc.dart';
import '../widgets/userList.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: BlocProvider(
        create: (_) => getIt<UsersBloc>()..add(FetchUsersEvent()),
        child: const UserList(),
      ),
    );
  }
}
