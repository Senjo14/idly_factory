import 'package:get/get.dart';

class Greeting extends GetxService {
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning!";
    } else if (hour < 18) {
      return "Good Afternoon!";
    } else {
      return "Good Evening!";
    }
  }

  Future<bool> isUserSignedIn() async {
    return true;
  }


}
