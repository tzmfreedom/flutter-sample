import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:provider/provider.dart';

class ImageView extends StatelessWidget {
  const ImageView({ this.onTap, this.navBar });

  final Function(int) onTap;
  final BottomNavigationBar navBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image View'),
      ),
      body: Container(
        child: Consumer<TaskViewModel>(
          builder: (context, viewModel, child) {
            final children = <Widget>[];
            final size = MediaQuery.of(context).size;
            final itemWidth = (size.width) / 3;
            final itemHeight = itemWidth + 40;
            List.generate(30, (index) {
              final image = Image.network(
                  'https://picsum.photos/id/$index/300/300',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(child: CircularProgressIndicator());
                }
              );
              children.add(
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets
                          .only(top: 10, right: 10, left: 1),
                      child: Column(
                        children: <Widget>[
                          image,
                          Text('image $index'),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(top: 5),
                            child: const Text('hoge fuga'),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog<AlertDialog>(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                                title: Text('image $index'),
                                content: image,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20))
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                      child: const Text('Close'),
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
            });
            return GridView.count(
              children: children,
              crossAxisCount: 3,
              childAspectRatio: itemWidth/itemHeight,
            );
          },
        ),
      ),
      bottomNavigationBar: navBar,
    );
  }
}
