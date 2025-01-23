import 'package:flutter/material.dart';
import 'package:flutter_exercise_form_todolist/util/store.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text(context.watch<StateData>().userName),
        ElevatedButton(
          onPressed: () {
            context.read<StateData>().setUserName('我是修改后的用户名');
          },
          child: const Text('Add Todo'),
        ),
      ],
    ));
  }
}
