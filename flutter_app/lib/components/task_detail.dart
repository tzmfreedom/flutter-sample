import 'package:flutter/material.dart';
import 'package:flutterapp/models/task.dart';

class TaskDetail extends StatelessWidget {
  final Task item;
  TaskDetail({Key key, this.item }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${item.title}'),
      ),
      body: Column(
        children: <Widget>[
          Text(item.title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
          Text(item.body, style: TextStyle(
            fontSize: 15,
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Back',
        child: Icon(Icons.arrow_back),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

