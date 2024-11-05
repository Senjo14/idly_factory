import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  static const LatLng initialCameraPosition = LatLng(11.0927743, 77.9334589);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  LatLng _currentLocation = MapScreen.initialCameraPosition;
  final LatLng _shopPosition = LatLng(11.219592, 78.171158);
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _setInitialMarkers();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 14.0,
        ),
        markers: _markers,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error("Location Services are disabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location Permissions are permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
      _updateMarkers();
      _mapController.animateCamera(
        CameraUpdate.newLatLng(_currentLocation),
      );
    });
  }

  void _setInitialMarkers() {
    _markers.add(
      Marker(
        markerId: MarkerId("shopLocation"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: _shopPosition,
        infoWindow: InfoWindow(title: "Shop Location"),
      ),
    );
  }

  void _updateMarkers() {
    _markers.add(
      Marker(
        markerId: MarkerId("CurrentLocation"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: _currentLocation,
        infoWindow: InfoWindow(title: "Your Location"),
      ),
    );
  }
}
