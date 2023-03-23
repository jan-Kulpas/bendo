import 'package:bendo/models/task_state.dart';
import 'package:bendo/providers/task.dart';
import 'package:bendo/widgets/tile.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    final task = context.watch<Task>();

    return MultiTile(
      color: task.state.color,
      flex: const [2, 1],
      children: [
        TileBody(child: Text(task.title)),
        GestureDetector(
          onTap: task.cycleState,
          child: TileBody(
            child: Text(
              // ignore: todo
              // TODO update for collection state names and neutral ignore
              task.state.name,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
