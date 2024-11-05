class PaymentModel {
  final String paymentId;
  final String paymentMethod;
  final double amount;
  final DateTime paymentDate;

  PaymentModel({required this.paymentId, required this.paymentMethod, required this.amount, required this.paymentDate});
}
