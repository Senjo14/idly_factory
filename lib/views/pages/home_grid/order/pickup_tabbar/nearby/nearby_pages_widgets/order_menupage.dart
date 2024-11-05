import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/widgets/common_widgets/ev_large_button.dart';

class OrderMenuPage extends StatefulWidget {
  const OrderMenuPage({super.key});

  @override
  State<OrderMenuPage> createState() => _OrderMenuPageState();
}

class _OrderMenuPageState extends State<OrderMenuPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Assuming you have a cart item count variable
  int cartItemCount = 0; // Change this as per your logic

  final products = List.generate(
    17,
        (index) => Product(
      id: 'product_${index + 1}',
      name: 'Product ${index + 1}',
      description: 'Description of Product ${index + 1}',
      imageUrl: 'assets/images/logo/hamburger.png', // Example image URL
    ),
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        title: Text("Menu"),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.red,
          indicatorWeight: 0.3,
          controller: _tabController,
          tabs: [
            Tab(text: "Full Menu"),
            Tab(text: "Recents"),
            Tab(text: "Favourites"),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Get.toNamed("/productDetail", arguments: product);
                          },
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              product.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(product.name),
                          subtitle: Text(product.description),
                        ),
                        Divider(thickness: 1, color: Colors.grey[300]),
                      ],
                    );
                  },
                ),
                Center(child: Text("No recent orders")),
                Center(child: Text("No favourite items")),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("order");
            },
            child: Container(
              color: Color(0xffd9ac72),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.red[700],
                        size: 28.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "Pickup  ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        "Anna Nagar",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
          ),
          // Conditional Button for Empty Cart
          if (cartItemCount == 0) // Show this button only if cart is empty
            InkWell(
              onTap: () {
                Get.toNamed("productList"); // Navigate to product list or menu
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 46.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {}, // Keep it disabled for now
                  child: Text(
                    "Your cart is empty",
                    style: AppTextStyle.bodyText.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}
