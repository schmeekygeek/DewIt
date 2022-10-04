import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/task_model.dart';
import 'package:todo/providers/theme_model.dart';

Future<void> dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        icon: const Icon(FontAwesomeIcons.barsProgress),
        title: const Text("New Task"),
        content: TextField(
          style: TextStyle(
            color: context.watch<ThemeModel>().isDark ? Colors.white : Colors.black87,
          ),
          decoration: const InputDecoration(
            hintText: "e.g. Buy groceries",
          ),
          autofocus: true,
          onChanged:(value) => context.read<TaskModel>().setInput(value),
          onSubmitted: (value) => context.read<TaskModel>().setInput(value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if(context.read<TaskModel>().getInput().isNotEmpty) {
                context.read<TaskModel>().addTask(context.read<TaskModel>().getInput(), 0);
                context.read<TaskModel>().setInput('');
              }
                Navigator.pop(context);
            },
            child: const Text("Done"),
          )
        ],
      );
    }
  );
}
