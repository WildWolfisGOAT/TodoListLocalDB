import 'package:flutter/material.dart';
import 'package:localdb_todo/modules/view/widgets/todo_category_custom_builder.dart';
import 'package:localdb_todo/modules/view/widgets/todo_priority_custom_builder.dart';
import 'package:localdb_todo/modules/view/widgets/todo_status_custom_builder.dart';
import 'package:localdb_todo/modules/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

import 'widgets/create_todo_loading_overlay.dart';

class TodoCreateScreen extends StatefulWidget{
  const TodoCreateScreen({super.key});

  @override
  State<TodoCreateScreen> createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends State<TodoCreateScreen> {
  final TextEditingController myController1 = TextEditingController();
  final TextEditingController myController2=TextEditingController();
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     return Stack(
       children: [
         Scaffold(
          appBar: AppBar(
            title: const Text("Create a todo task"),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: myController1,
                      decoration: const InputDecoration(
                        hintText: 'Enter a todo'
                        ),
                        maxLength: 100,
                        validator: (input){
                            if(input==null) return 'Enter title';
                            if(input.trim().isEmpty) return 'Title is required';
                            if(input.trim().length<5) return 'Mininmum 5 characters required';
                            return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    TextField(
                      controller: myController2,
                      decoration: const InputDecoration(
                        hintText: 'Enter description'
                        ), 
                        maxLines: 5,
                        maxLength: 500,
                      ),
                      const TodoCategoryCustomBuilder(),
                      const TodoPriorityCustomBuilder(),
                      const TodoStatusCustomBuilder(),
                      const SizedBox(height:16), 
                      Center(
                        child: FilledButton(
                          onPressed: (){
                            _onSavedButtonTapEvent(context);
                          },
                          child: const Text('Save')
                          ),
                      )
                  ],
                ),
              ),
            ),
          ),
         ),
         const CreateTodoLoadingOverlay(),
       ],
     );   
     
  }

  void _onSavedButtonTapEvent(BuildContext context) {
    if(formKey.currentState?.validate()==true){
      context.read<TodoViewModel>().createTodoEvent(
        title:myController1.text.trim(),
        description:myController2.text.trim().isNotEmpty?
        myController2.text.trim():null,
        onCompleted:(result){
          Navigator.of(context).pop(result);
      }, 
      );
    }
  }

  @override
  void dispose(){
    myController1.dispose();
    super.dispose();
  }
}

