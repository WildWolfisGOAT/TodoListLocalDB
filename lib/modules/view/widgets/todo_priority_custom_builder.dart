import 'package:flutter/material.dart';
import 'package:localdb_todo/modules/enums/todo_priority.dart';
import 'package:localdb_todo/modules/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoPriorityCustomBuilder extends StatelessWidget{
  const TodoPriorityCustomBuilder({super.key});
  @override
  Widget build(BuildContext context) {
     final selectedPriority = context.watch<TodoViewModel>().priority;
      return SizedBox(
        height: 50,
        child: Row(
          children:[
            const Text('Priority'),
            const Spacer(),
            ...TodoPriority.values.map((priority){
            return Padding(
              padding: const EdgeInsets.only(right:10), 
              child: InputChip(
                selected: selectedPriority==priority,
                label: Text(priority.name),
                onSelected: (value){
                  _onSelectedEvent(value, context, priority);
                },
                ),
            );
          }),

          ] 
        ),
      );
  }

  void _onSelectedEvent(bool value, BuildContext context, TodoPriority priority) {
    if(value){
      context.read<TodoViewModel>().changeTodoPriorityEvent(priority);
    }
  }

}