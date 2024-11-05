import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:idly_factory/constants/text_styles.dart';
import 'package:idly_factory/controllers/onboard_controllers/learn_more.dart';
import 'package:idly_factory/widgets/common_widgets/icon_buttons.dart';
import '../constants/strings.dart';
import '../widgets/common_widgets/ev_large_button.dart';

class LearnMorePage extends StatelessWidget {
  final BenefitController _controller = Get.put(BenefitController());
  final PageController _pageController = PageController();
  final RxInt _currentPage = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(AppStrings.exploreBenefits.tr, style: AppTextStyle.sectionTitlesH3),
        actions: [
          Padding(
            padding: EdgeInsets.all(5.w),
            child: IconButtons(
              icon: Icons.close,
              iconSize: 25.w,
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (_controller.benefits.isEmpty) {
          return Center(child: Text("No benefits found"));
        } else {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _controller.benefits.length,
                  onPageChanged: (index) {
                    _currentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(16.w),
                      child: imageContent(index),
                    );
                  },
                ),
              ),
              _buildPageIndicator(),
              _buildActionButtons(context),
            ],
          );
        }
      }),
    );
  }

  Column imageContent(int index) {
    final benefit = _controller.benefits[index];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(benefit.image, height: 200.h),
        SizedBox(height: 20.h),
        Text(benefit.title.tr, style: AppTextStyle.sectionTitlesH3),
        SizedBox(height: 10.h),
        Text(
          benefit.description.tr,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.sp),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_controller.benefits.length, (index) {
          return Container(
            margin: EdgeInsets.all(4.w),
            width: _currentPage.value == index ? 12.w : 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage.value == index ? Colors.red : Colors.grey,
            ),
          );
        }),
      );
    });
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.w),
                  side: BorderSide(color: Colors.grey),
                ),
              ),
              child: Text(
                AppStrings.maybeLater.tr,
                style: AppTextStyle.errorMessages,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: EvLargeButton(
              text: AppStrings.getStarted.tr,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
