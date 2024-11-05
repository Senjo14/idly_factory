import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:idly_factory/core/export.dart';

class FoodDetailPage extends StatefulWidget {
  const FoodDetailPage({super.key});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int totalQuantity = 0;
  String selectedOrderType = 'Small'; // Track selected order type
  int maxQuantity = 25; // Default max quantity for small
  List<int> selectedQuantities = [0, 0, 0, 0]; // Selected quantities for each package
  double itemRate = 2.99; // Example price for a single item
  double totalPrice = 0; // Total price calculation
  String buttonText = "Add to Cart"; // Initial button text
  List<int> availableQuantities = []; // Quantities available for selection

  @override
  void initState() {
    super.initState();
    _updateMaxQuantity(selectedOrderType); // Initialize available quantities
  }

  void _calculateTotalPrice() {
    totalQuantity = selectedQuantities.fold(0, (sum, quantity) => sum + quantity); // Calculate total quantity
    setState(() {
      totalPrice = itemRate * totalQuantity; // Calculate total price based on selected quantities
      buttonText = totalQuantity > 0
          ? "Add to Cart ($totalQuantity items - \$${totalPrice.toStringAsFixed(2)})"
          : "Add to Cart"; // Update button text with total quantity and price
    });
  }

  void _updateMaxQuantity(String type) {
    switch (type) {
      case 'Small':
        maxQuantity = 25;
        break;
      case 'Medium':
        maxQuantity = 100;
        break;
      case 'Large':
        maxQuantity = 500;
        break;
    }
    _initializeAvailableQuantities(maxQuantity); // Update available quantities
  }

  void _initializeAvailableQuantities(int max) {
    availableQuantities = List.generate(max + 1, (index) => index); // Generates quantities from 0 to max
  }

  void _onQuantityChange(int index, int? newValue) {
    if (newValue != null) {
      selectedQuantities[index] = newValue; // Set the selected quantity for the specific package
      _calculateTotalPrice(); // Update total price when quantity changes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Details"),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity * 0.8,
              height: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/logo/hamburger.png'), // Example image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Idly Special",
              style: TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Delicious soft idly served with fresh chutney and sambar.",
              style: TextStyle(fontSize: 16.0.sp, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              "Select Order Type:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            // Order Type Selection
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ['Small', 'Medium', 'Large'].map((type) {
                    return Row(
                      children: [
                        Radio<String>(
                          value: type,
                          groupValue: selectedOrderType,
                          onChanged: (value) {
                            setState(() {
                              selectedOrderType = value!;
                              _updateMaxQuantity(selectedOrderType);
                              selectedQuantities = [0, 0, 0, 0]; // Reset quantities when order type changes
                              totalPrice = 0;
                              buttonText = "Add to Cart";
                            });
                          },
                        ),
                        Text(type),
                      ],
                    );
                  }).toList(),
                ),
                Text(
                  "Max quantity for $selectedOrderType: $maxQuantity",
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 16),
            Column(
              children: List.generate(4, (index) {
                return DropdownButton<int>(
                  value: selectedQuantities[index],
                  items: availableQuantities.map((int quantity) {
                    return DropdownMenuItem<int>(
                      value: quantity,
                      child: Text(quantity.toString()),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    _onQuantityChange(index, newValue);
                  },
                  hint: Text("Package ${index + 1}"),
                );
              }),
            ),
            SizedBox(height: 16),
            Text(
              "Total Price: \$${totalPrice.toStringAsFixed(2)}", // Display the total price
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 16),
            Text(
              "Our idly is made with the finest ingredients and cooked to perfection, ensuring a soft and fluffy texture that pairs perfectly with our house-made chutneys and sambar.",
              style: TextStyle(fontSize: 14.0.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(),));
                  print("Order complete with quantities: $selectedQuantities and total price: $totalPrice");
                  Navigator.pop(context, {
                    'item': 'Idly Special',
                    'size': selectedOrderType,
                    'totalPrice': totalPrice,
                  });

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  padding: EdgeInsets.symmetric(vertical: 14.0.h),
                ),
                child: Text(
                  buttonText, // Display dynamic button text
                  style: TextStyle(fontSize: 16.0.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
