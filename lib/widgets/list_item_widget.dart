import 'package:flutter/material.dart';
import 'package:todo/classes/task.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/task_model.dart';

class ListItem extends StatefulWidget {


  final Task task;
  const ListItem({ super.key,  required this.task });


  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) => Future.value(direction == DismissDirection.endToStart),
      onDismissed: (direction) {
        context.read<TaskModel>().removeTask(widget.task);
      },
      direction: DismissDirection.endToStart,
      movementDuration: const Duration(seconds: 1),
      background: Container(
        color: Colors.redAccent,
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.delete_outline_rounded),
          ),
        ),
      ),
      child: CheckboxListTile(
        value: widget.task.getIsDone,
        onChanged: (value) => context.read<TaskModel>().toggleDone(widget.task),
        title: Text(
          widget.task.getText,
          style: TextStyle(
            decoration: (widget.task.getIsDone) ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
