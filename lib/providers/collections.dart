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

  void dummyInit() {
    Collection collection = Collection("Test");
    _items.add(collection);
    collection.addTask(Task("Twoj"));
    collection.addTask(Task("Stary"));

    Collection collection2 = Collection("xdxdxd");
    _items.add(collection2);
    collection2.addTask(Task("Twoja"));
    collection2.addTask(Task("Stara"));

    notifyListeners();
  }
}
