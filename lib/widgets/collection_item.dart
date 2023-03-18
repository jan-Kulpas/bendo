import 'package:bendo/widgets/task_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bendo/providers/collection.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    final collection = context.watch<Collection>();
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        children: [
          Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              width: double.infinity,
              child: Center(
                child: Text(collection.title),
              ),
            ),
          ),
          // Placeholder(), //chart bar
          ...collection.tasks.map(
            (task) => ChangeNotifierProvider.value(
              value: task,
              child: const TaskItem(),
            ),
          ),
          // Placeholder(), //add button
          Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              width: double.infinity,
              child: Text("${collection.tasks.length} ITEMS"),
            ),
          ), //item count
        ],
      ),
    );
  }
}
