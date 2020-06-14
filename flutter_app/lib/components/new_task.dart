import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_form.dart';

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: NewTaskForm(),
    );
  }
}
