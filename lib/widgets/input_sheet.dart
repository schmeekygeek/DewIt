import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/task_model.dart';
import '../providers/theme_model.dart';

String task = '';

Future<void> bottomSheetBuilder(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14),
        topRight: Radius.circular(14),
      ),
    ),
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    backgroundColor: !context.read<ThemeModel>().isDark
        ? const Color.fromARGB(255, 255, 250, 243)
        : const Color.fromARGB(255, 25, 23, 36),
    builder: (context) {
      return SizedBox(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 5,
            left: 12,
            top: 12,
            right: 12,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "New Task",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8),
                    fillColor: !context.read<ThemeModel>().isDark
                        ? Colors.pink.withOpacity(0.1)
                        : const Color.fromARGB(255, 25, 23, 36),
                    filled: true,
                    hintText: "e.g Buy Groceries",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                      color: context.read<ThemeModel>().isDark
                          ? Colors.white
                          : const Color.fromARGB(255, 25, 23, 36),
                      letterSpacing: 1),
                  onChanged: (value) => task = value,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 2,
                      child: OutlinedButton.icon(
                        label: const Text("Cancel"),
                        icon: const Icon(
                          FontAwesomeIcons.ban,
                          size: 20,
                        ),
                        onPressed: () => Navigator.pop(context),
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.transparent),
                          foregroundColor: const MaterialStatePropertyAll(Colors.red),
                          textStyle: const MaterialStatePropertyAll(
                            TextStyle(
                              fontSize: 15,
                              fontFamily: "Poppins",
                            ),
                          ),
                          side: MaterialStatePropertyAll( BorderSide(
                            color: Colors.red.withOpacity(0.87),
                            width: 1,
                          ) ),
                          fixedSize: const MaterialStatePropertyAll(
                            Size(
                              140,
                              40
                            ),
                          ),
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Expanded(
                      flex: 2,
                      child: FilledButton.icon(
                        label: const Text("Done"),
                        icon: const Icon(
                          FontAwesomeIcons.check,
                          size: 20,
                        ),
                        onPressed: () {
                          if (task.isNotEmpty) {
                            context.read<TaskModel>().addTask(task, 0);
                            task = '';
                          }
                          Navigator.pop(context);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent),
                          foregroundColor: MaterialStatePropertyAll(Colors.black87),
                          textStyle: MaterialStatePropertyAll(
                            TextStyle(
                              fontSize: 15,
                              fontFamily: "Poppins",
                            ),
                          ),
                          fixedSize: MaterialStatePropertyAll(
                            Size(
                              140,
                              40
                            ),
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
