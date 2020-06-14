import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:provider/provider.dart';

class CustomTabbarView extends StatelessWidget {
  const CustomTabbarView({ this.onTap, this.navBar });

  final Function(int) onTap;
  final BottomNavigationBar navBar;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Todo App'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
              ],
            ),
          ),
          body: Container(
            child: Consumer<TaskViewModel>(
              builder: (context, viewModel, child) {
                return const TabBarView(
                  children: <Widget>[
                    Text('Hello'),
                    Text('World'),
                  ],
                );
              },
            ),
          ),
          bottomNavigationBar: navBar,
        )
    );
  }
}
