import 'package:idly_factory/core/export.dart';

class SplashController extends GetxController with SingleGetTickerProviderMixin {
  RxString imageUrl = "".obs;
  RxBool isLoading = true.obs;

  late AnimationController animationController;
  late Animation<double> animation;

  final OnboardingService _onboardingService = OnboardingService();

  @override
  void onInit() {
    super.onInit();
    fetchSplashImage();
    animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: 0.8).animate(animationController);
    animationController.forward();

    Future.delayed(const Duration(seconds: 5), () {
      Get.offAll(() => const LanguageRegion());
    });
  }

  Future<void> fetchSplashImage() async {
    try {
      isLoading.value = true;
      String fetchedImageUrl = await _onboardingService.fetchSplashImage();
      imageUrl.value = fetchedImageUrl;
    } catch (e) {
      imageUrl.value = 'assets/images/onboard_images/factory_logo.jpg';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
