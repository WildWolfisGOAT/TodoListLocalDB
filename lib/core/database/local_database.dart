import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase();

  late final Database database;

  Future<void> createDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = '$databasesPath/my_database.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        log('Database created at $path');
        await db.execute(
          'CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT, category TEXT NOT NULL, priority TEXT NOT NULL, status TEXT NOT NULL, createdAt INTEGER NOT NULL, updatedAt INTEGER, deletedAt INTEGER)',
        );
        log('Created table todos');
      },
      onOpen: (db) {
        log('Database opened ${db.path}');
      },
    );
  }
}