// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum TaskState {
  Neutral,
  Priority,
  Working,
  Submitted,
  Approved,
  Done,
}

extension TaskStateExtension on TaskState {
  static Map<TaskState, Color> colorMap = {
    TaskState.Neutral: Colors.grey.shade600,
    TaskState.Priority: Colors.red,
    TaskState.Working: Colors.yellow,
    TaskState.Submitted: Colors.blue,
    TaskState.Approved: Colors.pink,
    TaskState.Done: Colors.green
  };

  Color get color {
    return colorMap[this] ?? Colors.grey.shade600;
  }
}
