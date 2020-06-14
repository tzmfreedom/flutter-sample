import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainMap extends StatefulWidget {
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Treasure Mapp'),),
      body: Container(
        child: const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(41.9028, 12.4964),
            zoom: 12,
          ),
        ),
      ),
    );
  }
}
