import 'package:flutter/material.dart';

class IdlyOrderPage extends StatefulWidget {
  @override
  _IdlyOrderPageState createState() => _IdlyOrderPageState();
}

class _IdlyOrderPageState extends State<IdlyOrderPage> {
  String selectedOrderType = 'Small'; // Default order type
  int quantity = 15; // Default quantity
  double ratePerIdly = 2.0; // Example rate per Idly
  List<int> packageDivisions = [];

  @override
  void initState() {
    super.initState();
    calculatePackages(); // Initial calculation
  }

  // Function to calculate package divisions based on order type and quantity
  void calculatePackages() {
    packageDivisions.clear();
    int tempQuantity = quantity; // Create a temporary variable for calculation

    if (selectedOrderType == 'Small') {
      if (tempQuantity >= 15 && tempQuantity <= 25) {
        packageDivisions.add(tempQuantity);
      } else if (tempQuantity > 25 && tempQuantity <= 50) {
        packageDivisions.add(25);
        packageDivisions.add(tempQuantity - 25);
      }
    } else if (selectedOrderType == 'Medium') {
      if (tempQuantity >= 50 && tempQuantity <= 250) {
        int packs = (tempQuantity / 50).ceil();
        for (int i = 0; i < packs; i++) {
          packageDivisions.add(50);
        }
      }
    } else if (selectedOrderType == 'Large') {
      if (tempQuantity >= 250) {
        int maxPackages = 6;
        int packSize = (tempQuantity / maxPackages).ceil();
        for (int i = 0; i < maxPackages && tempQuantity > 0; i++) {
          int currentPack = (tempQuantity > packSize) ? packSize : tempQuantity;
          packageDivisions.add(currentPack);
          tempQuantity -= currentPack;
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Idly Order"),
        backgroundColor: Colors.red[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Center(
              child: Image.asset(
                'assets/images/idly.png', // Make sure the path is correct
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),

            // Order Type Dropdown
            Text(
              "Select Order Type:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedOrderType,
              onChanged: (value) {
                setState(() {
                  selectedOrderType = value!;
                  calculatePackages();
                });
              },
              items: ['Small', 'Medium', 'Large']
                  .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
                  .toList(),
            ),
            SizedBox(height: 16.0),

            // Quantity Input
            Text(
              "Enter Quantity:",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  quantity = int.tryParse(value) ?? 15;
                  calculatePackages();
                });
              },
            ),
            SizedBox(height: 16.0),

            // Package Divisions
            Text(
              'Package Divisions: ${packageDivisions.join(', ')}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

            // Total Price Calculation
            Text(
              'Total Price: \$${(quantity * ratePerIdly).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
