import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_row.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Container(
          child: Consumer<TaskViewModel>(
            builder: (context, viewModel, child) {
              return ListView(
                children: viewModel.items.map((item) => TaskRow(item: item)).toList(),
              );
            },
          )
      ),
      floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/tasks/new');
                if (result != null) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
                }
              },
              tooltip: 'Add',
              child: Icon(Icons.add),
            );
          }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
