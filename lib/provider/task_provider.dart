import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  var tasksBox = Hive.box<TaskModel>("TASK_BOX");
  List<TaskModel> tasks = [];

  void addTask({required TaskModel model}) {
    tasksBox.add(model);
    tasks = tasksBox.values.toList();
    notifyListeners();
  }

  void deleteTask({required TaskModel model}) {
    model.delete();
    tasks = tasksBox.values.toList();
    notifyListeners();
  }

  void getAlltasks() {
    tasks = tasksBox.values.toList();
    notifyListeners();
  }
}
