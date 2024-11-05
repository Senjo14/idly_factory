import 'package:flutter/material.dart';

import '../../../../../models/order/order_map/order_map.dart';
import '../../../../../services/order_service/order_service_map/order_service_map.dart';

class OrderTrackingScreen extends StatefulWidget {
  final String orderId;

  OrderTrackingScreen({required this.orderId});

  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late OrderService orderService;
  late Order order;
  late Stream<String> orderStatusStream;

  @override
  void initState() {
    super.initState();
    orderService = OrderService();
    fetchOrderDetails();
    orderStatusStream = orderService.getOrderUpdates(widget.orderId);
  }

  Future<void> fetchOrderDetails() async {
    order = await orderService.fetchOrder(widget.orderId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Tracking")),
      body: order != null
          ? Column(
        children: [
          ListTile(
            title: Text("Order ID: ${order.id}"),
            subtitle: Text("Delivery Address: ${order.deliveryAddress}"),
            trailing: Text("Distance: ${order.distance} km"),
          ),
          StreamBuilder<String>(
            stream: orderStatusStream,
            builder: (context, snapshot) {
              String status = order.status;
              if (snapshot.hasData) {
                status = snapshot.data!;
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Current Status: $status",
                  style: TextStyle(fontSize: 20),
                ),
              );
            },
          ),
        ],
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}


/*
// Example button to navigate to order tracking
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderTrackingScreen(orderId: "order123"),
      ),
    );
  },
  child: Text("Track Order"),
)

 */