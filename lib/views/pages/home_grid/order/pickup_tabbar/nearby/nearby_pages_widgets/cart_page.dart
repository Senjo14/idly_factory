import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
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
        child: Column(
          children: [
            // Rewards Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tim Rewards", style: TextStyle(fontSize: 20)),
                Text("0 Points", style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 10),

            // Container with yellow background
            Container(
              width: double.infinity,
              height: 200, // Adjust height as needed
              color: Colors.yellow[700], // Sad color
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Rewards My Points", style: TextStyle(fontSize: 18)),
                      ToggleButtons(
                        children: [Text("Level 1"), Text("Level 2")],
                        isSelected: [true, false],
                        onPressed: (int index) {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Chosen Reward Level", style: TextStyle(fontSize: 16)),
                          Text("Idly", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Type",
                          style: TextStyle(color: Colors.red, decoration: TextDecoration.underline),
                        ),
                      ),
                      Text("400 Points", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Order Details Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(),
                  SizedBox(height: 5),
                  Text("Idly Food", style: TextStyle(fontSize: 16)),
                  Text("Favourites: It is Cons", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Item Total", style: TextStyle(fontSize: 16)),
                      Text("\$10.00", style: TextStyle(fontSize: 16)), // Example price
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Edit", style: TextStyle(color: Colors.blue)),
                      Text("Remove", style: TextStyle(color: Colors.red)),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Text("-"),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("1"), // Quantity
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Text("+"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Add Items Button
            ElevatedButton(
              onPressed: () {
                // Action to add items
              },
              child: Text("Add Items"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
