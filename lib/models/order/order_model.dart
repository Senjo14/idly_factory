class OrderModel {
  final String orderId;
  final DateTime orderDate;

  //final List<OrderItem> items;
  final double totalPrice;
  final String status;

  OrderModel(
      {required this.orderId,
      required this.orderDate,
      required this.totalPrice,
      required this.status});
}
