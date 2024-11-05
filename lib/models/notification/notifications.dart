class NotificationModel {
  final String notificationId;
  final String title;
  final String message;
  final DateTime receivedAt;

  NotificationModel({required this.notificationId, required this.title, required this.message, required this.receivedAt});
}
