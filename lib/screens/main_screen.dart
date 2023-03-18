import 'package:bendo/providers/collection.dart';
import 'package:bendo/providers/task.dart';
import 'package:bendo/widgets/task_item.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ChangeNotifierProvider.value(
            value: Task("lmao xd"),
            child: const TaskItem(),
          ),
        ),
      ),
    );
  }
}
