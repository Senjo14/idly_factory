import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:idly_factory/constants/strings.dart';
import 'package:idly_factory/constants/text_styles.dart';
import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/views/pages/tim_financial_profile/tims_financial_profile.dart';
import 'package:idly_factory/widgets/common_widgets/bottom_navigationbar.dart';
import 'package:idly_factory/widgets/common_widgets/ev_large_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controllers/bottom_bar/bottom_bar.dart';

class TimsFinancial extends StatefulWidget {
  const TimsFinancial({super.key});

  @override
  State<TimsFinancial> createState() => _TimsFinancialState();
}

class _TimsFinancialState extends State<TimsFinancial> {
  bool isLogin = true;
  int currentStep =0;

  final BottomNavBarController _bottomNavBarController =
  Get.put(BottomNavBarController());
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tims Financial"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 5,
                physics: AlwaysScrollableScrollPhysics(),
                controller: pageController,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 250.h,
                        width: 350.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            "assets/images/background/delivery.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Get to Know Tims Financial",
                        style: AppTextStyle.sectionTitlesH3,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "With Tims Rewards Points on Every purchase,\n it'll be your new favourite way to pay",
                        style: AppTextStyle.bodyText,
                      ),
                    ],
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 5,
              effect: WormEffect(
                activeDotColor: Colors.blue,
                dotHeight: 10.h,
                dotWidth: 10.w,
              ),
            ),
            SizedBox(height: 60.h),
            Text(
              "Tims Financial is working with Neo Financial and financial institutions to offer products and services.",
              style: AppTextStyle.smallText,
            ),
            SizedBox(height: 10.h),
            _buildActionButtons(context)
          ],
        ),
      ),
      bottomNavigationBar: isLogin ? BottomNavBar(
          currentIndex: _bottomNavBarController.selectedIndex.value,
          onTap: _bottomNavBarController.onItemTapped) : SizedBox.shrink(),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.w),
                ),
              ),
              child: Text(
                AppStrings.learnMore.tr,
                style: AppTextStyle.errorMessages,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: EvLargeButton(
              text: isLogin ? AppStrings.signIn : AppStrings.signUp,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              onPressed: () {
                if (isLogin == true) {

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimsFinancialProfile()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage(initialTabIndex: 1)),
                  );
                }
              },
            ),
          ),

        ],
      ),
    );
  }
}
