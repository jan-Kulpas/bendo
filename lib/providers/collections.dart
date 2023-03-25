import 'package:bendo/providers/collection.dart';
import 'package:bendo/providers/task.dart';
import 'package:flutter/material.dart';

class Collections with ChangeNotifier {
  final List<Collection> _items = [];

  List<Collection> get items {
    return [..._items];
  }

  void addCollection(Collection collection) {
    collection.parent = this;
    _items.add(collection);
    notifyListeners();
  }

  void deleteCollection(Collection collection) {
    print("xd?");
    for (Task task in collection.tasks) {
      collection.deleteTask(task);
    }
    collection.parent = null;
    _items.remove(collection);
    notifyListeners();
  }

  Future<void> dummyInit() async {
    await Future.delayed(const Duration(milliseconds: 100), () {});

    Collection collection = Collection(title: "Test");
    addCollection(collection);
    collection.addTask(Task(title: "Twoj"));
    collection.addTask(Task(title: "Stary"));

    Collection collection2 = Collection(title: "xdxdxd");
    addCollection(collection2);
    collection2.addTask(Task(title: "Twoja"));
    collection2.addTask(Task(title: "Stara"));

    notifyListeners();
  }
}
