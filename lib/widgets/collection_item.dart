import 'package:bendo/widgets/expansion_list.dart';
import 'package:bendo/widgets/rename_item_widget.dart';
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
                onTap: collection.toggleExpand,
                child: const TileBody(),
              ),
              TileBody(
                child: IntrinsicWidth(
                  child: RenameItemWidget(
                    title: collection.title,
                    hintText: "Delete?",
                    alignment: TextAlign.center,
                    onSave: (value) => collection.rename(value),
                  ),
                ),
              ),
              GestureDetector(
                onTap: collection.toggleExpand,
                child: TileBody(
                  child: Text(collection.expanded ? "▼" : "▲"),
                ),
              ),
            ],
          ),
          // Placeholder(), //chart bar

          ExpansionList(
            expanded: collection.expanded,
            children: collection.tasks
                .map(
                  (task) => ChangeNotifierProvider.value(
                    value: task,
                    child: TaskItem(key: UniqueKey()),
                  ),
                )
                .toList(),
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
