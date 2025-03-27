import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:localdb_todo/modules/enums/todo_category.dart';
import 'package:localdb_todo/modules/enums/todo_priority.dart';
import 'package:localdb_todo/modules/enums/todo_status.dart';
import 'package:localdb_todo/modules/model/todo_model.dart';
import 'package:localdb_todo/modules/services/todo_db_services.dart';

class TodoViewModel extends ChangeNotifier{
      TodoCategory category = TodoCategory.personal;
      TodoPriority priority = TodoPriority.urgent;
      TodoStatus status=TodoStatus.pending;
      bool isLoading = false;
      List<TodoModel> todos=[];

      final service = TodoDBServices();

      void changeTodoCategoryEvent(TodoCategory category){
        this.category=category;
        notifyListeners();
      }
  
      void changeTodoPriorityEvent(TodoPriority priority){
        this.priority=priority;
        notifyListeners();
      } 
      
      void changeTodoStatusEvent(TodoStatus status){
        this.status=status;
        notifyListeners();
      }

  void createTodoEvent({
    required String title, 
    String? description,
    required Function(TodoModel? result) onCompleted,
    }) async{
      final model=TodoModel(
        title: title, 
        description: description, 
        priority: priority,   
        status: status, 
        category: category, 
        createdAt: DateTime.now(), 
        );
        isLoading=true;
        notifyListeners();
        final result = await service.createTodo(model);
        onCompleted.call(result);
        isLoading=false;
        notifyListeners();
  }

  void fetchAllTodosEvent() async{
    isLoading=true;
    notifyListeners();
    final result = await service.getAllTodos();
    todos=result ?? [];
    isLoading=false;
    notifyListeners();
  }

  void create100Todo() async {
    final faker= Faker();
    for(int i=0;i<100;i++){
      await service.createTodo(
        TodoModel(
          title: 'Task ${i+1} ${faker.lorem.sentence()}', 
          priority: faker.randomGenerator.boolean()? TodoPriority.urgent : TodoPriority.urgent, 
          status: TodoStatus.pending, 
          category: faker.randomGenerator.boolean()? TodoCategory.personal : TodoCategory.work, 
          createdAt: DateTime.now()
        )
      );
    
    }
  }
}