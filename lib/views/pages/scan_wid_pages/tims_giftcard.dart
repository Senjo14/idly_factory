import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idly_factory/core/export.dart'; // Import for responsive design

class TimsGiftCard extends StatefulWidget {
  const TimsGiftCard({super.key});

  @override
  State<TimsGiftCard> createState() => _TimsGiftCardState();
}

class _TimsGiftCardState extends State<TimsGiftCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            25.verticalSpace,
            Center(
              child: Text(AppStrings.timsGiftCard,
                style: AppTextStyle.mainHeader,
              ),
            ),
            15.verticalSpace,
            Center(
              child: Text(
                "Scan to pay will become available\n after your first digital purchase,\n or by transferring in a Tims Gift Card\n balance",
                textAlign: TextAlign.center,
                style:  AppTextStyle.bodyText
              ),
            ),
            20.verticalSpace,
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
              onPressed: () {},
              child: Text(AppStrings.getStarted,
                style:AppTextStyle.errorMessages,
              ),
            ),
            15.verticalSpace,
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  textStyle: TextStyle(fontSize: 20.sp),
                ),
                onPressed: () {},
                child: Text(
                  "Transfer balance from another\n Tims Gift Card",
                  style: AppTextStyle.errorMessages,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
