import 'package:flutter/material.dart';
import 'package:localdb_todo/modules/view/todo_create_screen.dart';
import 'package:localdb_todo/modules/view/widgets/all_todo_list_builder.dart';

import 'package:localdb_todo/modules/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoMainScreen extends StatelessWidget {
  const TodoMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Main Screen'),
        actions: [
          IconButton(
           onPressed: (){
             context.read<TodoViewModel>().create100Todo();
           },
           icon: const Icon(Icons.data_array)
           )
        ],
      ),
      body: const AllTodoListBuilder(),
      
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Create'),
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder:(newContext)=>ChangeNotifierProvider.value(
                  value: context.read<TodoViewModel>(),
                  child: const TodoCreateScreen(),
              ) 
              ),
          );
        },
        icon: const Icon(Icons.add),
        ),     
      );
  }
  
}