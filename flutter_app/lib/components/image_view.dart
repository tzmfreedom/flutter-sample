import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_row.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:provider/provider.dart';

class ImageView extends StatelessWidget {
  final onTap;
  final BottomNavigationBar navBar;

  ImageView({ this.onTap, this.navBar });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image View'),
      ),
      body: Container(
        child: Consumer<TaskViewModel>(
          builder: (context, viewModel, child) {
            var children = List<Widget>();
            for (var i = 0; i < 30; i++) {
              final image = Image.network(
                  'https://picsum.photos/id/$i/300/300');
              children.add(
                  GestureDetector(
                    child: image,
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                                title: Text('image $i'),
                                content: image,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                      child: Text('Close'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }
                                  )
                                ]
                            );
                          }
                      );
                    },
                  )
              );
            }
            return GridView.count(
              children: children,
              crossAxisCount: 3,
            );
          },
        ),
      ),
      bottomNavigationBar: navBar,
    );
  }
}
