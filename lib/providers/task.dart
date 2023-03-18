//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:bendo/models/task_state.dart';

class Task with ChangeNotifier {
  final String id = const Uuid().v4();
  TaskState state = TaskState.Neutral;
  String title;

  Task(this.title);

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
