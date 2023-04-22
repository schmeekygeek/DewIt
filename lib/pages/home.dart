import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'about.dart';
import '../classes/task.dart';
import '../services/util.dart';
import '../widgets/drawer_list_item.dart';
import '../widgets/input_dialog.dart';
import '../widgets/list_item_widget.dart';
import '../providers/task_model.dart';
import '../providers/theme_model.dart';
import '../services/snackbar_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerkey,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
          child: ListView(
            children: <Widget>[
              Text(
                "GOOD \n${getGreeting().toUpperCase()}",
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
              DrawerListItem(
                text: "TASKS",
                icon: const Icon(FontAwesomeIcons.clipboardList),
                onTap: () {
                  _drawerkey.currentState?.closeDrawer();
                },
              ),
              DrawerListItem(
                text: "ABOUT",
                icon: const Icon(FontAwesomeIcons.circleInfo),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const About(),
                    ),
                  );
                },
              ),
              DrawerListItem(
                text: context.watch<ThemeModel>().isDark
                    ? "LIGHT MODE"
                    : "DARK MODE",
                icon: Icon(
                  context.watch<ThemeModel>().isDark
                      ? FontAwesomeIcons.solidLightbulb
                      : Icons.dark_mode_rounded,
                ),
                onTap: () => context.read<ThemeModel>().toggle(),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.large(
            actions: [
              TextButton.icon(
                icon: const Icon(
                  Icons.sort_rounded,
                  textDirection: TextDirection.ltr,
                ),
                label: const Text("Sort"),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(100),
                  ),
                ),
                onPressed: () {
                  context.read<TaskModel>().sortTasks()
                      ? showSuccessfullySortedSnackbar(context)
                      : showNoTasksToSortSnackbar(context);
                },
              ),
            ],
            expandedHeight: 200,
            stretch: true,
            title: const Text(
              "TASKS",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 25,
                letterSpacing: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: context.watch<TaskModel>().tasks.isEmpty
                ? const Text(
                    "You haven't added any tasks yet.",
                    textAlign: TextAlign.center,
                  )
                : AnimatedOpacity(
                    opacity: 1,
                    alwaysIncludeSemantics: true,
                    duration: const Duration(seconds: 1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Icon(
                                FontAwesomeIcons.leftLong,
                                size: 14,
                              ),
                              Text(" Swipe left on a task to remove it  ")
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: context.watch<ThemeModel>().isDark
                                  ? const Color.fromARGB(255, 38, 35, 58)
                                  : const Color.fromARGB(255, 235, 188, 186),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Consumer<TaskModel>(
                              builder: (context, task, child) {
                                return Column(
                                  children: [
                                    const Center(
                                      child: Icon(FontAwesomeIcons.gripLines),
                                    ),
                                    for (Task task in task.tasks)
                                      ListItem(
                                        snackbar: () => showSnackBar(
                                          context,
                                          task.text!,
                                          task.isDone,
                                          context
                                              .read<TaskModel>()
                                              .tasks
                                              .indexOf(task),
                                        ),
                                        task: task,
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          FontAwesomeIcons.plus,
          size: 24,
        ),
        onPressed: () async {
          dialogBuilder(context);
        },
      ),
    );
  }
}
