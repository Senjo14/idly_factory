import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idly_factory/core/export.dart';

import 'language_region.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final SplashController _splashController = Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: Obx(() {
        if (_splashController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Center(
            child: FadeAnimationWidget(
              animation: _splashController.animation,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  _splashController.imageUrl.value,
                  fit: BoxFit.cover,
                  width: 0.2.sh,
                  height: 0.2.sh,
                  errorBuilder: (context, error, stackTrace) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Image.asset(
                        'assets/images/onboard_images/factory_logo.jpg',
                        width: 0.3.sh,
                        height: 0.3.sh,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
