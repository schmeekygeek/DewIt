import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/task.dart';
import '../providers/task_model.dart';

void showSnackBar(BuildContext context, String text, bool isDone, int index){
  Task task = Task(text: text, isDone: isDone);
  SnackBar snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    content: const Text("Task Deleted!"),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () {
        context.read<TaskModel>().addTaskObject(task, index);
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
