import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _googleMapController;
  final LatLng _startPosition = LatLng(11.111720, 78.004570);

  void _mapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            child: GoogleMap(
              mapType: MapType.satellite,
              onMapCreated: _mapCreated,
              initialCameraPosition: CameraPosition(
                target: _startPosition,
                zoom: 11.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
