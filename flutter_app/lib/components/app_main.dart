import 'package:flutter/material.dart';
import 'package:flutterapp/components/custom_tabbar_view.dart';
import 'package:flutterapp/components/main_map.dart';
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

  final navigationBarItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('HOME'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text('GRID VIEW'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.details),
      title: Text('DETAIL'),
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text('MAP'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      setState(() => _currentIndex = index);
    }
    final navBar = BottomNavigationBar(
      items: navigationBarItems,
      currentIndex: _currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
    );

    switch (_currentIndex) {
      case 0:
        return TodoList(navBar: navBar);
      case 1:
        return ImageView(navBar: navBar);
      case 2:
        return CustomTabbarView(navBar: navBar);
      case 3:
        return MainMap(onTap: onTap, navBar: navBar);
    }
    throw Exception('currentIndex is over');
  }
}
