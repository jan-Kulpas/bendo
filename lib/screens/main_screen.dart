import 'package:bendo/providers/collections.dart';
import 'package:bendo/widgets/collection_item.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final collections = context.read<Collections>();
    collections.dummyInit();
    return Scaffold(
      appBar: AppBar(), //! REMOVE
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: ChangeNotifierProvider.value(
          value: collections.items[0],
          child: const CollectionItem(),
        ),
      ),
    );
  }
}
