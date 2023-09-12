import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
