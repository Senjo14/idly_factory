import 'package:get/get.dart';

class IntoGreeting extends GetxController {
  var greeting = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _setGreeting();
  }

  void _setGreeting() {
    int hour = DateTime.now().hour;

    if (hour < 12) {
      greeting.value = "Good Morning,";
    } else if (hour < 17) {
      greeting.value = "Good Afternoon,";
    } else {
      greeting.value = "Good Evening,";
    }
  }
}
