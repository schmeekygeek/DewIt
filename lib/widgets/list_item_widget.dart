import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/classes/task.dart';
import 'package:todo/providers/task_model.dart';
import 'package:todo/providers/theme_model.dart';

class ListItem extends StatefulWidget {


  final Task task;
  const ListItem({ super.key,  required this.task });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> with TickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 2,
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(milliseconds: 200),
    );
    _controller.reverse();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      alwaysIncludeSemantics: true,
      opacity: widget.task.getIsDone ? 0.3 : 1,
      duration: const Duration(milliseconds: 800),
      child: Dismissible(
        key: UniqueKey(),
        confirmDismiss: (direction) => Future.value(direction == DismissDirection.endToStart),
        onDismissed: (direction) {
          context.read<TaskModel>().removeTask(widget.task);
        },
        direction: DismissDirection.endToStart,
        movementDuration: const Duration(seconds: 1),
        background: SizedBox(
          child: Container(
            color: Colors.redAccent,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(FontAwesomeIcons.trashCan),
              ),
            ),
          ),
        ),
        // https://assets8.lottiefiles.com/temp/lf20_eDCMYv.json
        child: CheckboxListTile(
          checkboxShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          value: widget.task.getIsDone,
          onChanged: (value) => context.read<TaskModel>().toggleDone(widget.task),
          title: Text(
            widget.task.getText!,
            style: TextStyle(
              decoration: (widget.task.getIsDone) ? TextDecoration.lineThrough : TextDecoration.none,
              color: context.watch<ThemeModel>().isDark ? Colors.white : Colors.black87,
              fontFamily: "Poppins",
              fontSize: 15,
              fontWeight: FontWeight.w100
            ),
          ),
        ),
      ),
    );
  }
}
