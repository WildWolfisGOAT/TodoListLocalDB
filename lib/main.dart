import 'package:flutter/material.dart';
import 'package:localdb_todo/application.dart';
import 'package:localdb_todo/core/database/local_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.instance.createDatabase();
  runApp(
    const Application()
  );
}

