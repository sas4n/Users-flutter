import 'package:flutter/material.dart';
import 'package:users_flutter/injection.dart';

import 'presentation/pages/usersPage.dart';

void main() async {
  setUp();
  runApp(const MyApp());
}

class MyApp extends MaterialApp {
  const MyApp({super.key}) : super(home: const UsersPage());
}
