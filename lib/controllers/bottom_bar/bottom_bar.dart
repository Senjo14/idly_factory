

import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
 RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;


    if (index == 0) {
      Get.toNamed('/home');
    } else if (index == 1) {

    } else if (index == 2) {
      Get.toNamed('/scan');
    }
  }
}
