import 'package:bendo/providers/collections.dart';
import 'package:bendo/widgets/collection_item.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    final collections = context.read<Collections>();
    collections.dummyInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final collections = context.watch<Collections>();
    return Scaffold(
      appBar: AppBar(), //! REMOVE
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          ...collections.items.map(
            (collection) => ChangeNotifierProvider.value(
              value: collection,
              child: const CollectionItem(),
            ),
          ),
        ],
      ),
    );
  }
}
