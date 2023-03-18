//import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

import 'package:bendo/providers/task.dart';
import 'package:bendo/models/task_state.dart';
import 'package:bendo/helpers/extensions.dart';

class Collection with ChangeNotifier {
  final String id = const Uuid().v4();
  final List<Task> _tasks = [];
  final Map<TaskState, String> states = TaskState.values.asNameMap().inverse;
  String title;

  Collection(this.title);

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
  }

  void deleteTask(String id) {
    _tasks.removeWhere((e) => e.id == id);
  }
}
