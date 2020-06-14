import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:flutterapp/models/task.dart';
import 'package:provider/provider.dart';

class TaskRow extends StatelessWidget {
  const TaskRow({Key key, this.item}) : super(key: key);

  final Task item;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children:<Widget>[
            Checkbox(
              value: item.done,
              onChanged: (value) {
                Provider.of<TaskViewModel>(context, listen: false).update(Task(
                  id: item.id,
                  done: value,
                  title: item.title,
                  body: item.body,
                ));
              },
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pushNamed(context, '/tasks/detail', arguments: item);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.title, style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(item.body, style: const TextStyle(
                        fontSize: 15
                    )),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
