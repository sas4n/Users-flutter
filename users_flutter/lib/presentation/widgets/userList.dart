import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_flutter/presentation/bloc/users_bloc.dart';

import 'bottomLoader.dart';
import 'userListItem.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        switch (state.status) {
          case UsersStatus.success:
            if (state.users.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.users.length
                    ? const BottomLoader()
                    : UserListItem(
                        user: state.users[index],
                        index: index + 1,
                      );
              },
              itemCount: state.hasReachedMax
                  ? state.users.length
                  : state.users.length + 1,
              controller: _scrollController,
            );
          case UsersStatus.failure:
            return const Center(child: Text('Failed to fetch posts'));
          case UsersStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<UsersBloc>().add(FetchUsersEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll);
  }
}
