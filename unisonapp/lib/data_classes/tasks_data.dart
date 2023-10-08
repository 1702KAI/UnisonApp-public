import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  String description;
  DateTime dueDate;
  String taskType;

  TaskData({
    required this.description,
    required this.dueDate,
    required this.taskType,
  });

  void setData({
    String? description,
    DateTime? dueDate,
    String? taskType,
  }) {
    if (description != null) this.description = description;
    if (dueDate != null) this.dueDate = dueDate;
    if (taskType != null) this.taskType = taskType;
    notifyListeners();
  }

  void clearData() {
    this.description = '';
    this.dueDate = DateTime.now();
    this.taskType = '';
    notifyListeners();
  }
}

class TaskDataProvider extends ChangeNotifier {
  List<TaskData> _tasks = []; // Initialize an empty list for tasks

  List<TaskData> get tasks => _tasks;

  // Add a method to update the list of tasks
  void setTasks(List<TaskData> newTasks) {
    _tasks = newTasks;
    notifyListeners();
  }
}


