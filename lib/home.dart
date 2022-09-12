import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/classes/task.dart';
import 'package:todo/services/greeting_service.dart';
import 'package:todo/widgets/drawer_list_item.dart';
import 'package:todo/widgets/list_item_widget.dart';
import 'providers/task_model.dart';
import 'providers/theme_model.dart';
import 'package:todo/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
ThemeSelector selector = const ThemeSelector();
TaskModel taskModel = TaskModel();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 10, 10),
          child: ListView(
            children: <Widget> [
              Text("GOOD \n${getGreeting().toUpperCase()}",
                style: const TextStyle(
                  overflow: TextOverflow.fade,
                  fontFamily: "Merriweather",
                  fontSize: 25,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const DrawerListItem(text: "TASKS", icon: Icon(Icons.checklist_rounded)),
              const DrawerListItem(text: "ABOUT", icon: Icon(Icons.info)),
              ListTile(
                onTap: () {
                  context.read<ThemeModel>().toggle();
                },
                dense: true,
                leading: Icon(context.watch<ThemeModel>().isDark ? Icons.light_mode_sharp : Icons.dark_mode_sharp),
                title: Text(
                  context.watch<ThemeModel>().isDark ? "LIGHT MODE" : "DARK MODE",
                  style: const TextStyle(
                    fontFamily: "Merriweather",
                    fontSize: 15,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        reverse: false,
        slivers: <Widget>[
          SliverAppBar.large(
            expandedHeight: 200,
            stretch: true,
            centerTitle: true,
              title: const Text(
                "TASKS",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 25,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Consumer<TaskModel>(
                builder: (context, task, child){
                  return Column(
                    children: [
                      for(Task task in task.tasks) ListItem(
                        task: task,
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30),
        onPressed: () {
          context.read<TaskModel>().addTask("Go to the library");
        },
      ),
    );
  }
}
