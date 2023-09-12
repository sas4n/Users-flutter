import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:users_flutter/domain/entity/user_entity.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    required this.user,
    required this.index,
    super.key,
  });
  final int index;
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(user.dateOfBirth ?? '');
    final dt = DateFormat.yMMMMd().format(date);
    final textTheme = Theme.of(context).textTheme;
    return Material(
        child: Container(
      margin: EdgeInsets.all(5),
      height: 180.0,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0.2),
      ),
      child: Card(
          elevation: 10.0,
          child: Row(
            children: [
              Card(child: Image.network(user.pictureUrl ?? '')),
              Column(
                children: [
                  Text(
                    'Username: ${user.username}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Gender: ${user.gender == 1 ? "M" : "W"}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'D.O.B: $dt',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Municipilaty: ${user.municipality}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Province: ${user.province}',
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              )
            ],
          )
          //child: Image.network(user.pictureUrl ?? ''),
          //leading: Text('$index', style: textTheme.bodySmall),
          //title: Text(user.username ?? ''),
          //isThreeLine: true,
          // subtitle: Text(user.municipality ?? ''),
          //dense: true,
          ),
    ));
  }
}
