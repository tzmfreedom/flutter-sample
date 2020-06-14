import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainMap extends StatefulWidget {
  const MainMap({ this.onTap, this.navBar });

  final Function onTap;
  final BottomNavigationBar navBar;

  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  Position position = Position(latitude: 35.645, longitude: 139.68);
  Set<Marker> markers = <Marker>{};

  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    final isGeolocationAvailable = await Geolocator()
        .isLocationServiceEnabled();
    if (isGeolocationAvailable) {
      try {
        position = await Geolocator().getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best
        );
        setState(() {
          markers.add(
              createMarker(position, 'currpos', 'You are here!')
          );
        });
      } on Exception catch(_) {
        // ignore
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Treasure Mapp'),),
      body: Container(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 16,
          ),
            markers: markers,
        ),
      ),
      bottomNavigationBar: widget.navBar,
    );
  }

  Marker createMarker(Position pos, String markerId, String markerTitle ) {
    final marker = Marker(
        markerId: MarkerId(markerId),
        position: LatLng(pos.latitude, pos.longitude),
        infoWindow: InfoWindow(title: markerTitle),
        icon: (markerId=='currpos') ?
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)
            :
        BitmapDescriptor
            .defaultMarkerWithHue(BitmapDescriptor.hueOrange)
    );
    return marker;
  }
}
