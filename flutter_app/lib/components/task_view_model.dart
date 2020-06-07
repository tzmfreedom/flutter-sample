import 'package:flutter/material.dart';
import 'package:flutterapp/models/task.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> items;

  TaskViewModel({ this.items });

  void add(Task item) {
    items.add(item);
    notifyListeners();
  }
}
