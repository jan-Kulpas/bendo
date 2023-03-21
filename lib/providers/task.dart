//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:bendo/models/task_state.dart';

const uuid = Uuid();

class Task with ChangeNotifier {
  final String id;
  TaskState state;
  String title;

  Task({
    String? id,
    required this.title,
    this.state = TaskState.Neutral,
  }) : id = id ?? uuid.v4();

  /// Cycles TaskState to next in order or
  /// loops back to beginning if task is Done.
  void cycleState() {
    if (state != TaskState.Done) {
      state = TaskState.values.elementAt(
        TaskState.values.indexOf(state) + 1,
      );
    } else {
      state = TaskState.Neutral;
    }

    notifyListeners();
  }
}
