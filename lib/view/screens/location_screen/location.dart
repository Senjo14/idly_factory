import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idly_factory/view/screens/location_screen/tabbar_pages/favourites.dart';
import 'package:idly_factory/view/screens/location_screen/tabbar_pages/nearby.dart';
import 'package:idly_factory/view/screens/location_screen/tabbar_pages/recents.dart';

import 'map_screen/delivery.dart';

class Location extends StatefulWidget {
  Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location>
    with SingleTickerProviderStateMixin {
  bool isMapLoading = false;
  late TabController _tabController;

  late GoogleMapController _googleMapController;

  final LatLng _startPosition = LatLng(11.111720, 78.004570);

  void _mapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3D7A6),
      appBar: AppBar(
        title: Text("Restaurant Locator"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket)),
          IconButton(
            onPressed: () {
              setState(() {
                isMapLoading = !isMapLoading;
              });
            },
            icon: isMapLoading
                ? Icon(Icons.menu_outlined)
                : Icon(Icons.map_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.brown,
                  height: 50,
                  width: 180,
                  child: Center(
                    child: Text(
                      "PickUp",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10), // Add spacing between buttons
              InkWell(
                onTap: () {
                  Get.to(()=>const Delivery());
                },
                child: Container(
                  color: Colors.white,
                  height: 50,
                  width: 180,
                  child: Center(
                    child: Text(
                      "Delivery",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: "Your Address",
              suffixIcon: const Icon(Icons.search, color: Colors.black),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: 10),
          if (!isMapLoading) ...[
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Color(0xffE3D7A6),
              indicatorColor: Colors.red,
              tabs: [
                Tab(child: Text("Nearby")),
                Tab(child: Text("Favourites")),
                Tab(child: Text("Recents")),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  Nearby(),
                  Favourites(),
                  Recents(),
                ],
              ),
            ),
          ] else ...[
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                onMapCreated: _mapCreated,
                initialCameraPosition:
                CameraPosition(target: _startPosition, zoom: 1.0),
              ),
            ),
          ]
        ]),
      ),
    );
  }
}
