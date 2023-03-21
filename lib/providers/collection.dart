//import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

import 'package:bendo/providers/task.dart';
import 'package:bendo/models/task_state.dart';
import 'package:bendo/helpers/extensions.dart';

const uuid = Uuid();

class Collection with ChangeNotifier {
  final String id;
  final List<Task> _tasks = [];
  final Map<TaskState, String> states = TaskState.values.asNameMap().inverse;
  String title;
  bool collapsed;

  Collection({
    String? id,
    required this.title,
    this.collapsed = false,
  }) : id = id ?? uuid.v4();

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
  }

  void deleteTask(String id) {
    _tasks.removeWhere((e) => e.id == id);
  }

  void toggleCollapse() {
    collapsed = !collapsed;
    notifyListeners();
  }
}
