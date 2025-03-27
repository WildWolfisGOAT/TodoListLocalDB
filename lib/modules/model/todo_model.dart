import 'package:localdb_todo/modules/enums/todo_category.dart';
import 'package:localdb_todo/modules/enums/todo_priority.dart';
import 'package:localdb_todo/modules/enums/todo_status.dart';

class TodoModel {
  const TodoModel({
  this.id, 
  required this.title, 
  this.description, 
  required this.priority, required this.status, 
  required this.category, required this.createdAt, 
  this.updatedAt, this.deletedAt
  });

  factory TodoModel.fromDBMap(Map<String,dynamic> map){
    return TodoModel(
      id: map['id'] as int,
      title: map['title'] as String, 
      description: map['description'] as String?, 
      category: TodoCategory.mapToTodoCategory(map['category'] as String), 
      priority: TodoPriority.mapToTodoCategory(map['priority'] as String), 
      status: TodoStatus.mapToTodoCategory(map['status'] as String), 
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int), 
      updatedAt: (map['updatedAt'] as int?)!=null ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int):null, 
      deletedAt:(map['deletedAt'] as int?)!=null ? DateTime.fromMillisecondsSinceEpoch(map['deletedAt'] as int):null
      );

  }

  final int? id;
  final String title;
  final String? description;
  final TodoPriority priority;
  final TodoStatus status;
  final TodoCategory category;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  // read documentation is says that this database package can only access dataTypes of int,REAL,TEXT,String BLOB....and we have created enums and DateTime data stamps so we need to let database know about our data types

  Map<String,dynamic> toDatabaseMap(){
    return {
      'title':title.trim(),
      'description':description,
      'category':category.name,
      'priority':priority.name,
      'status':status.name,
      'createdAt':createdAt.millisecondsSinceEpoch,
      'updatedAt':updatedAt?.millisecondsSinceEpoch,
      'deletedAt':deletedAt?.millisecondsSinceEpoch,
    };
  }

  TodoModel copyWith({
    int? id,

  }){
    return TodoModel(
      id:id ?? this.id,
      title: title, 
      description: description, 
      priority: priority, 
      status: status, 
      category: category, 
      createdAt: createdAt, 
      updatedAt: updatedAt, 
      deletedAt: deletedAt
      );
  }
  
  mapToTodoCategory(String map) {}
}