import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/task.dart';
import 'package:http/http.dart' as http;

class TaskViewModel extends ChangeNotifier {
  List<Task> items = List<Task>();

  static const BASE_URL = 'http://10.0.2.2:3000/Todos';

  TaskViewModel() {
    this.load();
  }

  void add(Task item) async {
    final res = await http.post(
        BASE_URL,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'done': item.done,
          'title': item.title,
          'body': item.body,
        })
    );
    if (res.statusCode == 200) {
      final task = Task.fromJson(json.decode(res.body));
      items.add(Task(
          id: task.id,
          done: item.done,
          title: item.title,
          body: item.body
      ));
      notifyListeners();
    } else {

    }
  }

  void update(Task task) async {
    final res = await http.put(
        BASE_URL + '/' + task.id.toString(),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'done': task.done,
          'title': task.title,
          'body': task.body,
        })
    );
    final index = items.indexWhere((element) => element.id == task.id);
    final item = items[index];
    items[index] = Task(
      id: item.id,
      done: task.done,
      title: item.title,
      body: item.body
    );
    notifyListeners();
  }

  Future<void> load() async {
    final res = await http.get(BASE_URL);
    final List<dynamic> tasks = json.decode(res.body);
    items = tasks.map((e) {
      return Task.fromJson(e);
    }).toList();
    notifyListeners();
  }
}
