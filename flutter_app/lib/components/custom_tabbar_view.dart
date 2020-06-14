import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/components/task_view_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class CustomTabbarView extends StatefulWidget {
  const CustomTabbarView({ this.navBar });

  final BottomNavigationBar navBar;

  @override
  _CustomTabbarViewState createState() => _CustomTabbarViewState();
}

class _CustomTabbarViewState extends State<CustomTabbarView> {
  CameraController _controller;
  Widget _cameraPreview;

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      final camera = cameras.first;
      _controller = CameraController(camera, ResolutionPreset.medium);
      await _controller.initialize();
      setState(() {
        _cameraPreview = Center(child: CameraPreview(_controller));
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller != null && !_controller.value.isInitialized) {
      return Container();
    }
    debugPrint('123');
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
                return TabBarView(
                  children: <Widget>[
                    const Text('Hello'),
                    _cameraPreview,
                  ],
                );
              },
            ),
          ),
          floatingActionButton: IconButton(
            icon: const Icon(Icons.camera),
            onPressed: () async {
              final path = join(
                (await getTemporaryDirectory()).path,
                '${DateTime.now()}.png',
              );
              debugPrint(path);
              await _controller.takePicture(path);
            },
          ),
          bottomNavigationBar: widget.navBar,
        )
    );
  }
}
