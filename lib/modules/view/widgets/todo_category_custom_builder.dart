import 'package:flutter/material.dart';
import 'package:localdb_todo/modules/enums/todo_category.dart';
import 'package:localdb_todo/modules/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoCategoryCustomBuilder extends StatelessWidget{
  const TodoCategoryCustomBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedCategory = context.watch<TodoViewModel>().category;
      return SizedBox(
        height: 50,
        child: Row(
          children:[
            const Text('Category'),
            const Spacer(),
            ...TodoCategory.values.map((category){
                return Padding(
                  padding: const EdgeInsets.only(right:10), 
                  child: InputChip(
                  selected: selectedCategory==category,
                  label: Text(category.name),
                  onSelected: (value){
                    _onSelectedEvent(value, context, category);
                  },
                  ),
            );  
          }),
          ] 
        ),
      );
  }

  void _onSelectedEvent(bool value, BuildContext context, TodoCategory category) {
      if(value){
      context.read<TodoViewModel>().changeTodoCategoryEvent(category);
    }
  }
}