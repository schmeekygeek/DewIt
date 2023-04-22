import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/shared_prefs_service.dart';

import '../classes/task.dart';

class TaskModel with ChangeNotifier {

  SharedPreferences? prefs;
  String _input = '';

  List<Task> tasks = [];

  void addTask(String text, int index) async {
    tasks.insert(0, Task(text: text, isDone: false));
    saveData();
    notifyListeners();
  }

  bool sortTasks() {
    if(tasks.isNotEmpty){
      for(Task task in tasks) {
        if(task.isDone){
          tasks.remove(task);
          tasks.add(task);
        }
      }
      notifyListeners();
      saveData();
      return true;
    }
    return false;
  }

  void addTaskObject(Task task, int index) async {
    tasks.insert(index, task);
    saveData();
    notifyListeners();
  }

  void toggleDone(Task task){
    task.toggle();
    saveData();
    notifyListeners();
  }

  void removeTask(Task taskToRemove){
    tasks.remove(taskToRemove);
    saveData();
    notifyListeners();
  }

  void initPrefs() async {
    await SharedPreferencesService.init();
    prefs = SharedPreferencesService.instance;
    loadData();
    notifyListeners();
  }

  void saveData() {
    List<String>? prefList = tasks.map((task) => json.encode(task.toMap())).toList();
    prefs?.setStringList('tasks', prefList);
  }

  void loadData() {
    List<String>? prefList = prefs!.getStringList('tasks');
    if (prefList != null) {
      tasks = prefList.map((task) => Task.fromMap(json.decode(task))).toList();
    }
  }

  void setInput(String inputText) => _input = inputText;
  String getInput() => _input;
}
