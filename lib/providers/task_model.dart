import 'package:flutter/material.dart';
import 'package:todo/classes/task.dart';

class TaskModel with ChangeNotifier {
  List<Task> tasks = [
    Task(text: "Go to the market", isDone: false),
    Task(text: "Fetch newspaper from jason's", isDone: false),
  ];

  void addTask(String text){
    tasks.add(Task(text: text, isDone: false));
    notifyListeners();
  }
  void toggleDone(Task task){
    task.toggle();
    notifyListeners();
  }
  void removeTask(Task taskToRemove){
    tasks.remove(taskToRemove);
    notifyListeners();
  }
}
