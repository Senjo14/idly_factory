import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idly_factory/widgets/common_widgets/ev_large_button.dart';

class Recents extends StatelessWidget {
  const Recents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3D7A6),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              50.verticalSpace,
              Image.asset(
                "assets/images/logo/coffee-app.png",
                height: 150.h,
                width: 150.w,
              ),
              20.verticalSpace,
              Text(
                "Log In to See Recent Locations",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                textAlign: TextAlign.center,
              ),
              20.verticalSpace,
              Text(
                "First log in or sign up for an account.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 20.h),
              EvLargeButton(
                text: "Sign In",
                onPressed: () {},
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 95),
              )
            ],
          ),
        ),
      ),
    );
  }
}
