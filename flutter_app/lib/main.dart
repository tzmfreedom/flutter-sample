import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_detail.dart';
import 'package:provider/provider.dart';

import 'package:flutterapp/components/task_view_model.dart';
import 'package:flutterapp/models/task.dart';

import 'components/app_main.dart';
import 'components/new_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return TaskViewModel()
          ..load();
      },
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
          '/tasks': (context) => AppMain(),
          '/tasks/detail': (context) {
            final item = ModalRoute.of(context).settings.arguments as Task;
            return TaskDetail(item: item);
          },
          '/tasks/new': (context) => NewTask(),
        },
      ),
    );
  }
}

