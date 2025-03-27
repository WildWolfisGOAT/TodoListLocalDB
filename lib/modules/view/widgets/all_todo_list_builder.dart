import 'package:flutter/material.dart';
import 'package:localdb_todo/modules/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

class AllTodoListBuilder extends StatefulWidget {
  const AllTodoListBuilder({super.key});

  @override
  State<AllTodoListBuilder> createState() => _AllTodoListBuilderState();
}

class _AllTodoListBuilderState extends State<AllTodoListBuilder> {
  @override
  void initState() {
    super.initState();
    Future.microtask((){
      if(mounted) context.read<TodoViewModel>().fetchAllTodosEvent();
    });
  }
  

  @override
  Widget build(BuildContext context) {
    final todos= context.watch<TodoViewModel>().todos;
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(
              todo.title,
              style:Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              ),
            subtitle: todo.description!=null? 
            Text(
              todo.description!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              ):
              null,
            onTap: (){},
          );
        }
    );
  }
}