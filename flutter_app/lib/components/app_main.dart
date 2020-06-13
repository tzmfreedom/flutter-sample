import 'package:flutter/material.dart';
import 'package:flutterapp/components/custom_tabbar_view.dart';
import 'package:flutterapp/components/todo_list.dart';
import 'package:flutterapp/components/image_view.dart';

class AppMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppMain();
  }
}

class _AppMain extends State<AppMain> {
  int _currentIndex = 0;

  List<BottomNavigationBarItem> navigationBarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("HOME"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text("GRID VIEW"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.details),
      title: Text("DETAIL"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final onTap = (index) {
      setState(() => _currentIndex = index);
    };
    final navBar = BottomNavigationBar(
      items: navigationBarItems,
      currentIndex: _currentIndex,
      onTap: onTap,
    );// This trailing comma makes auto-formatting nicer for build methods.

    switch (_currentIndex) {
      case 0:
        return TodoList(onTap: onTap, navBar: navBar);
      case 1:
        return ImageView(onTap: onTap, navBar: navBar);
      case 2:
        return CustomTabbarView(onTap: onTap, navBar: navBar);
    }
  }
}
