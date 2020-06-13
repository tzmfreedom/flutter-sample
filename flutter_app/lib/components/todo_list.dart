import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_row.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoList();
  }
}

class _TodoList extends State<TodoList> {
  int _currentIndex = 0;

  final views = [
    Container(
      child: Consumer<TaskViewModel>(
        builder: (context, viewModel, child) {
          return ListView(
            children: viewModel.items.map((item) => TaskRow(item: item)).toList(),
          );
        },
      ),
    ),
    Container(
      child: Consumer<TaskViewModel>(
        builder: (context, viewModel, child) {
          var images = List<Widget>();
          for (var i = 0; i < 30; i++) {
            images.add(
                CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/id/${i}/100/100',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
            );
          }
          return GridView.count(
            children: images,
            crossAxisCount: 3,
          );
        },
      ),
    ),
    Container(
      child: Consumer<TaskViewModel>(
        builder: (context, viewModel, child) {
          return Text('detail');
        },
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: views[_currentIndex],
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("HOME"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("SEARCH"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            title: Text("DETAIL"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
