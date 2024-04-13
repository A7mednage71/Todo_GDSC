import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  var tasksBox = Hive.box<TaskModel>("TASK_BOX");

  Future<void> addTask({required TaskModel model}) async {
    await tasksBox.add(model);
    notifyListeners();
  }

  Future<void> deleteTask({required TaskModel model}) async {
    await model.delete();
    notifyListeners();
  }

  getAlltasks() {
    List<TaskModel> tasks = tasksBox.values.toList();
    return tasks;
  }
}
