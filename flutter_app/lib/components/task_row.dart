import 'package:flutter/material.dart';
import 'package:flutterapp/models/task.dart';

class TaskRow extends StatelessWidget {
  final Task item;
  TaskRow({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/tasks/detail", arguments: item);
      },
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Text(item.title, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
              Text(item.body, style: TextStyle(
                  fontSize: 15
              )),
            ],
          )
      ),
    );
  }
}
