import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/task.dart';
import 'package:http/http.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> items = <Task>[];
  bool isLoaded = false;
  Client client = Client();

  static const baseUrl = 'http://localhost:3000/Todos';

  Future<void> add(Task item) async {
    final res = await client.post(
        baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'done': item.done,
          'title': item.title,
          'body': item.body,
        })
    );
    if (res.statusCode == 201) {
      final task = Task.fromJson(json.decode(res.body) as Map<String, dynamic>);
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

  Future<void> update(Task task) async {
    final res = await client.put(
        '$baseUrl/${task.id}',
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'done': task.done,
          'title': task.title,
          'body': task.body,
        })
    );
    if (res.statusCode == 200) {
      final index = items.indexWhere((element) => element.id == task.id);
      final item = items[index];
      items[index] = Task(
          id: item.id,
          done: task.done,
          title: item.title,
          body: item.body
      );
      notifyListeners();
    } else {

    }
  }

  Future<void> load() async {
    final res = await client.get(baseUrl);
    if (res.statusCode == 200) {
      final tasks = json.decode(res.body) as List<dynamic>;
      items = tasks.map((dynamic e) {
        return Task.fromJson(e as Map<String, dynamic>);
      }).toList();
      isLoaded = true;
      notifyListeners();
    } else {

    }
  }
}
