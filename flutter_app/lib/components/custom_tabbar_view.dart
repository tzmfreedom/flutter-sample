import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_row.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:provider/provider.dart';

class CustomTabbarView extends StatelessWidget {
  final Function onTap;
  final BottomNavigationBar navBar;

  CustomTabbarView({ this.onTap, this.navBar });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Todo App'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
          ),
          body: Container(
            child: Consumer<TaskViewModel>(
              builder: (context, viewModel, child) {
                return TabBarView(
                  children: <Widget>[
                    Text('Hello'),
                    Text('World'),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: navBar,// This trailing comma makes auto-formatting nicer for build methods.
        )
    );
  }
}
