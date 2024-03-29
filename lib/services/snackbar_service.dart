import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../classes/task.dart';
import '../providers/task_model.dart';

void showSnackBar(BuildContext context, String text, bool isDone, int index){
  Task task = Task(text: text, isDone: isDone);
  SnackBar snackBar = SnackBar(
    duration: const Duration(seconds: 2),
    content: const Text("Task Deleted!"),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12)
      )
    ),
    action: SnackBarAction(
      label: "Undo",
      onPressed: () {
        context.read<TaskModel>().addTaskObject(task, index);
      },
      textColor: Colors.black,
      disabledTextColor: Colors.black87,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessfullySortedSnackbar(BuildContext context){
  SnackBar snackBar = const SnackBar(
    duration: Duration(seconds: 2),
    content: Text("Successfully sorted tasks!"),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12)
      )
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showNoTasksToSortSnackbar(BuildContext context){
  SnackBar snackBar = const SnackBar(
    duration: Duration(seconds: 2),
    content: Text("There are no tasks to sort."),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12)
      )
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
