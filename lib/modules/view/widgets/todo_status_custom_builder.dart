import 'package:flutter/material.dart';
import 'package:localdb_todo/modules/enums/todo_status.dart';
import 'package:localdb_todo/modules/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoStatusCustomBuilder extends StatelessWidget{
  const TodoStatusCustomBuilder({super.key});
  @override
  Widget build(BuildContext context) {
     final selectedStatus = context.watch<TodoViewModel>().status;
      return SizedBox(
        height: 50,
        child: Row(
          children: [
            const Text('Status'),
            const Spacer(),
            ...TodoStatus.values.map((status){
            return Padding(
              padding: const EdgeInsets.only(right:10), 
              child: InputChip(
                selected: selectedStatus==status,
                label: Text(status.name),
                onSelected: (value){
                  _onSelectedEvent(value, context, status);
                },
                ),
            );
          }),
          ]
          
        ),
      );
  }

  void _onSelectedEvent(bool value, BuildContext context, TodoStatus status) {
    if(value){
      context.read<TodoViewModel>().changeTodoStatusEvent(status);
    }
  }

}