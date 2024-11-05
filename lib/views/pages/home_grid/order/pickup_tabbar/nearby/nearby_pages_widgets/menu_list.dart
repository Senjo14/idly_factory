import 'package:flutter/material.dart';
import 'package:idly_factory/core/export.dart';

import 'order_menupage.dart';
class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Product> products; // Declare a list to hold products

  @override
  void initState() {
    super.initState();
    products = Get.arguments as List<Product>;
    _tabController = TabController(length: products.length, vsync: this); // Initialize the TabController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: products.map((product) => Tab(text: product.name)).toList(), // Create tabs dynamically
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: products.map((product) {
          return Center(
            child: Text(product.description),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
