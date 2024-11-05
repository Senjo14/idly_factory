import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/views/pages/home_grid/order/map_screen/map_screen.dart';
import 'package:idly_factory/views/pages/home_grid/order/pickup_tabbar/nearby/nearby.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isMapLoading = false;
  static const LatLng _startPosition = LatLng(11.111720, 78.004570);
  final TextEditingController _controller = TextEditingController();
  final List<dynamic> _places = [
    {'name': 'Restaurant A', 'address': 'Address 1'},
    {'name': 'Cafe B', 'address': 'Address 2'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3D7A6),
      appBar: AppBar(
        title: const Text("Restaurant Locator"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_basket)),
          IconButton(
            onPressed: () {
              setState(() {
                isMapLoading = !isMapLoading;
              });
            },
            icon: isMapLoading
                ? const Icon(Icons.menu_outlined)
                : const Icon(Icons.map_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildToggleButtons(),
            const SizedBox(height: 10),
            _buildAutocomplete(),
            const SizedBox(height: 10),
            Expanded(
              child: isMapLoading ? _buildMapView() : _buildTabView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              color: Colors.brown,
              height: 50,
              child: const Center(
                child: Text(
                  "PickUp",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InkWell(
            onTap: () => Get.toNamed("/Delivery"),
            child: Container(
              color: Colors.white,
              height: 50,
              child: const Center(
                child: Text(
                  "Delivery",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAutocomplete() {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        List<String> allOptions = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'];
        return allOptions.where((option) {
          return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        _controller.text = selection;
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: "Search location",
          ),
        );
      },
    );
  }

  Widget _buildMapView() {
    return const Expanded(
      child: MapScreen()
    );
  }

  Widget _buildTabView() {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.red,
            indicatorWeight: 1.5,
            indicatorSize:TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: "Nearby"),
              Tab(text: "Favourites"),
              Tab(text: "Recents"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Nearby(places: _places),
                Favourites(),
                const Recents(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
