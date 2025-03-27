import 'dart:developer';
import 'package:localdb_todo/core/database/local_database.dart';
import 'package:localdb_todo/modules/model/todo_model.dart';

class TodoDBServices {
  Future<TodoModel?> createTodo(TodoModel model) async {
    try {
      final db = await LocalDatabase.instance.database; // Await the database instance
      final id = await db.insert(
        'todos',
        model.toDatabaseMap(),
      );
      log('Created todo at $id');
      return model.copyWith(id: id);
    } catch (e, s) {
      log('createTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<List<TodoModel>?> getAllTodos() async {
    try {
      final db = await LocalDatabase.instance.database; // Await the database instance
      final result = await db.query('todos');
      return result.map((map) => TodoModel.fromDBMap(map)).toList();
    } catch (e, s) {
      log('AllTodos', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<TodoModel?> updateTodo(int id, TodoModel model) async {
    try {
      final db = await LocalDatabase.instance.database; // Await the database instance
      final result = await db.update(
        'todos',
        model.toDatabaseMap(),
        where: 'id = ?',
        whereArgs: [id],
      );
      log('Updated $result todo');
      return model;
    } catch (e, s) {
      log('updateTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<void> deleteTodo(int id) async {
    try {
      final db = await LocalDatabase.instance.database; // Await the database instance
      final result = await db.delete(
        'todos',
        where: 'id = ?',
        whereArgs: [id],
      );
      log('Deleted $result todo');
    } catch (e, s) {
      log('deleteTodo', error: e, stackTrace: s, name: '$runtimeType');
    }
  }
}
