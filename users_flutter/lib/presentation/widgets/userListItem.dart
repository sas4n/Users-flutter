import 'package:flutter/material.dart';
import 'package:users_flutter/domain/entity/user_entity.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({required this.user, super.key});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${user.userId}', style: textTheme.bodySmall),
        title: Text(user.username ?? ''),
        isThreeLine: true,
        subtitle: Text(user.municipality ?? ''),
        dense: true,
      ),
    );
  }
}
