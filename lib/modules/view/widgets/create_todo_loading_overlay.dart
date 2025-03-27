import 'package:flutter/material.dart';
import 'package:localdb_todo/modules/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

class CreateTodoLoadingOverlay extends StatelessWidget {
  const CreateTodoLoadingOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isLoadingListener = context.watch<TodoViewModel>().isLoading;
    if(!isLoadingListener) return const SizedBox.shrink(); 
    return PopScope(
      canPop: false,
      // This above line signifies that user can't pop out from loading screen 
      child: Container(
       alignment: Alignment.center,
       constraints: const BoxConstraints.expand(),
       color: Colors.black54,
       child:  Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           const SizedBox(width: 24,height: 24,child: CircularProgressIndicator(),),
           const SizedBox(width: 8,),
           Text('Saving...',style: Theme.of(context).textTheme.titleSmall),
         ],
       ),
      ),
    );
  }
}