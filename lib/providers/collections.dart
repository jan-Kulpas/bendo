import 'package:bendo/providers/collection.dart';
import 'package:bendo/providers/task.dart';
import 'package:flutter/material.dart';

class Collections with ChangeNotifier {
  final List<Collection> _items = [];

  List<Collection> get items {
    return [..._items];
  }

  void addCollection(Collection collection) {
    _items.add(collection);
  }

  void deleteCollection(String id) {
    Collection collection = _items.firstWhere((e) => e.id == id);
    // ! Delete all tasks here
    _items.remove(collection);
  }

  Future<void> dummyInit() async {
    await Future.delayed(const Duration(milliseconds: 100), () {});

    Collection collection = Collection(title: "Test");
    _items.add(collection);
    collection.addTask(Task(title: "Twoj"));
    collection.addTask(Task(title: "Stary"));

    Collection collection2 = Collection(title: "xdxdxd");
    _items.add(collection2);
    collection2.addTask(Task(title: "Twoja"));
    collection2.addTask(Task(title: "Stara"));

    notifyListeners();
  }
}
