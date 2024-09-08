import 'package:flutter/material.dart';
import 'package:flutter_project/utils/app_styles.dart';

import '../models/todo.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo todo;
  final VoidCallback onDelete;
  final VoidCallback onToggleCompleted;
  final Function(Todo) onUpdate;

  const TodoItemWidget(
      {super.key,
      required this.todo,
      required this.onDelete,
      required this.onToggleCompleted,
      required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: ListTile(
        title: Text(
          todo.title,
          style: todo.isCompleted? AppStyles.completedTodoTextStyle:AppStyles.todoTextStyle,
        ),
        subtitle: Text(todo.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onToggleCompleted, icon: Icon(todo.isCompleted? Icons.check_box:Icons.check_box_outline_blank)),
            // IconButton(
            //       icon: const Icon(
            //         Icons.edit,
            //         color: AppStyles.secondaryColor,
            //       ),
            //       onPressed: () {
            //         _showEditTodoDialog(context, todo);
            //       }),
              IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}