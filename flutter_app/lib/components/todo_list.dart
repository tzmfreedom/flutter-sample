import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_row.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({ this.navBar });

  final BottomNavigationBar navBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              child: Text(
                'MyApp',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('hoge'),
            ),
            ListTile(
              title: Text('fuga'),
            ),
            ListTile(
              title: Text('foo'),
            ),
            ListTile(
              title: Text('bar'),
            ),
          ],
        )
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
                children: const <Widget>[
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
              child: const Icon(Icons.add),
            );
          }
      ),
      bottomNavigationBar: navBar,
    );
  }
}
