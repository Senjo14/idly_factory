import 'package:idly_factory/core/export.dart';
import 'package:idly_factory/dialogs/learn_more_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/Onboarding_service/bottom_sheet.dart';
import '../../../widgets/common_widgets/ev_large_button.dart';

class BottomSheetController extends GetxController {
  var hasShownBottomSheet = false.obs;

  final BottomSheetService bottomSheetService = BottomSheetService();

  @override
  void onInit() {
    super.onInit();
    _checkBottomSheetStatus();
  }

  Future<void> _checkBottomSheetStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isShown = prefs.getBool('bottomSheetShown');
    if (isShown == null || isShown == false) {
      hasShownBottomSheet.value = false;
    } else {
      hasShownBottomSheet.value = true;
    }
  }

  Future<void> setBottomSheetShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('bottomSheetShown', true);
    hasShownBottomSheet.value = true;
  }

  void showBottomSheet(BuildContext context) {
    if (!hasShownBottomSheet.value) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.r),
            topLeft: Radius.circular(10.r),
          ),
        ),
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.73.h,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Text(AppStrings.joinNow.tr,
                                style: AppTextStyle.cardTiles),
                          ),
                          SizedBox(height: 12.h),
                          Image.asset(
                            Assets.logo,
                            height: 200.h,
                            width: 300.w,
                          ),
                          SizedBox(height: 12.h),
                          Text(AppStrings.exclusiveBenefits.tr,
                              style: AppTextStyle.sectionTitlesH3),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: EdgeInsets.all(10.w),
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 8.w),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                //String iconPath = dataList[index]["iconPath"]!;
                              //  String text = dataList[index]["text"]!;

                                return Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/onboard_images/factory_logo.jpg",
                                      width: 46.w,
                                      height: 46.h,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(width: 20.w),
                                    Expanded(
                                      child: Text(
                                        "text".tr,
                                        style: AppTextStyle.bodyText,
                                        maxLines: 2,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                bottomContainer(context),
              ],
            ),
          );
        },
      );
      setBottomSheetShown();
    }
  }

  Container bottomContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Get.to(LearnMorePage());
            },
            child: Text(
              AppStrings.learnMore.tr,
              style: AppTextStyle.promotionalText,
            ),
          ),
          EvLargeButton(
            text: AppStrings.getStarted.tr,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
