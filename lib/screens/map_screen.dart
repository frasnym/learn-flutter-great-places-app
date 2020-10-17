import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initalLocation;
  final bool isSelecting;

  MapScreen({
    // Denpasat Lat Long: -8.6524973, 115.2191175
    this.initalLocation =
        const PlaceLocation(latitude: -8.6524973, longitude: 115.2191175),
    this.isSelecting = false,
  });

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Maps"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initalLocation.latitude,
            widget.initalLocation.longitude,
          ),
          zoom: 16,
        ),
      ),
    );
  }
}
