import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_row.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({ this.onTap, this.navBar });

  final Function(int) onTap;
  final BottomNavigationBar navBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Container(
        child: Consumer<TaskViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoaded) {
              return RefreshIndicator(
                  child: ListView(
                    children: viewModel.items.map((item) => TaskRow(item: item))
                        .toList(),
                  ),
                  onRefresh: () async {
                    await viewModel.load();
                  }
              );
            }
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.6),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () async {
                final result = await Navigator.pushNamed(context, '/tasks/new');
                if (result != null) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('$result')));
                }
              },
              tooltip: 'Add',
              child: Icon(Icons.add),
            );
          }
      ),
      bottomNavigationBar: navBar,
    );
  }
}
