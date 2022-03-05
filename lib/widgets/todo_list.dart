import 'package:flutter/material.dart';
import '../model/todo_model.dart';
import 'todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoModel>? todos;

  const TodoList({required this.todos, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = MediaQuery.of(context).size;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                mq.orientation == Orientation.portrait && size.width < 400
                    ? 2
                    : 3,
            childAspectRatio: 1),
        padding: const EdgeInsets.all(8.0),
        itemCount: todos!.length,
        itemBuilder: (BuildContext ctx, int i) => MyTodoItem(note: todos![i]));
  }
}
