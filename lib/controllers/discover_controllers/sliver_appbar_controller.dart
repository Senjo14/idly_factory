import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SliverAppBarController extends GetxController {
  RxBool isShow = false.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.offset > 45 && !isShow.value) {
      isShow.value = true;
    } else if (scrollController.offset <= 45 && isShow.value) {
      isShow.value = false;
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
