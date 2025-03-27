import 'package:flutter/material.dart';

import 'package:localdb_todo/modules/view/todo_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TodoProvider(),
    );
  }
}