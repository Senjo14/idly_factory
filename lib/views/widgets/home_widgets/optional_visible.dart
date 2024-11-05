import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import '../../../core/export.dart';

class OptionalInformation extends StatelessWidget {
  const OptionalInformation({
    super.key,
    required this.isOptionalInfoVisible,
  });

  final bool isOptionalInfoVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isOptionalInfoVisible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.dateOfBirth, style: TextStyle(fontSize: 16.sp)),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Year",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Month",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Day",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            "Must be added at least 7 Days prior to your birthday in order to\nreceive a Birthday Offer Reward this year",
            style: TextStyle(fontSize: 12.sp),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
