import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_detail.dart';
import 'package:provider/provider.dart';

import 'package:flutterapp/components/task_view_model.dart';
import 'package:flutterapp/models/task.dart';

import 'components/new_task.dart';
import 'components/task_row.dart';
import 'components/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(items: <Task>[
        Task(title: "task1", body: "body1"),
        Task(title: "task2", body: "body2"),
        Task(title: "task3", body: "body3"),
      ]),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/tasks',
        routes: {
          '/tasks': (context) => TodoList(),
          '/tasks/detail': (context) {
            final Task item = ModalRoute.of(context).settings.arguments;
            return TaskDetail(item: item);
          },
          '/tasks/new': (context) => NewTask(),
        },
      ),
    );
  }
}

