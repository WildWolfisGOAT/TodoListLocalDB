import 'package:flutter/widgets.dart';
import 'package:localdb_todo/modules/view/todo_main_screen.dart';
import 'package:localdb_todo/modules/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoProvider extends StatelessWidget{
  const TodoProvider({super.key});

  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider(
        create: (context)=>TodoViewModel(),
        child: const TodoMainScreen(),
        );
  }


}