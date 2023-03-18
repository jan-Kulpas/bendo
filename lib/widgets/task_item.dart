import 'package:bendo/models/task_state.dart';
import 'package:bendo/providers/task.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    final task = context.watch<Task>();

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2),
      elevation: 0,
      color: task.state.color,
      child: SizedBox(
        width: double.infinity,
        child: Row(children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              child: Text(task.title),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: GestureDetector(
              onTap: task.cycleState,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                child: Text(
                  // TODO update for collection state names and neutral ignore
                  task.state.name,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
