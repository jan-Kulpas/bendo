import 'package:bendo/widgets/task_item.dart';
import 'package:bendo/widgets/tile.dart';
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
          MultiTile(
            flex: const [1, -1, 1],
            children: [
              GestureDetector(
                onTap: collection.toggleCollapse,
                child: const TileBody(),
              ),
              TileBody(
                child: Text(
                  "${collection.title}${collection.collapsed ? "▼" : "▲"}",
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: collection.toggleCollapse,
                child: const TileBody(),
              ),
            ],
          ),
          // Tile(
          //   child: Center(
          //     child: Text(collection.title),
          //   ),
          // ),
          // Placeholder(), //chart bar
          ...collection.tasks.map(
            (task) => ChangeNotifierProvider.value(
              value: task,
              child: const TaskItem(),
            ),
          ),
          // Placeholder(), //add button
          Tile(
            child: Text("${collection.tasks.length} ITEMS"),
          ),
        ],
      ),
    );
  }
}
