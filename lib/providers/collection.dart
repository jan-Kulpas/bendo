//import 'package:flutter/material.dart';
import 'package:bendo/providers/collections.dart';
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

  Collections? parent;
  String title;
  bool expanded;

  Collection({
    String? id,
    required this.title,
    this.expanded = true,
  }) : id = id ?? uuid.v4();

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    task.parent = this;
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    task.parent = null;
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleExpand() {
    expanded = !expanded;
    notifyListeners();
  }

  /// Change the Collection title.
  /// If new title is an empty string the Task will be deleted.
  void rename(String newTitle) {
    print(parent);
    title = newTitle;
    if (newTitle.isEmpty) parent?.deleteCollection(this);
    notifyListeners();
  }
}
