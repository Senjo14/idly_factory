import 'dart:async';

import 'package:idly_factory/models/order/order_map/order_map.dart';

class OrderService {
  List<String> statusUpdates = [
    "Preparing",
    "Baking",
    "Out for Delivery",
    "Delivered",
  ];


  Future<Order> fetchOrder(String orderId) async {
    await Future.delayed(Duration(seconds: 2));

    return Order(
      id: orderId,
      status: statusUpdates[0],
      distance: 2.5,
      deliveryAddress: "123 Main St, Anytown, USA",
    );
  }

  Stream<String> getOrderUpdates(String orderId) async* {
    for (var status in statusUpdates) {
      await Future.delayed(Duration(seconds: 3));
      yield status;
    }
  }
}
