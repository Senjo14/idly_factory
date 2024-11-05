import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Ensure you import GetX

import '../../../../../../core/export.dart';

class Favourites extends StatelessWidget {
  Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> favoritePlaces = Get.arguments ?? [];
    return Scaffold(
      backgroundColor: const Color(0xffE3D7A6),
      body: favoritePlaces.isNotEmpty
          ? ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          var place = favoritePlaces[index];
          return ListTile(
            title: Text(place['name']),
            subtitle: Text(place['info'] ?? 'No info available'),
            trailing: const Icon(Icons.favorite, color: Colors.red),
          );
        },
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(flex: 3,
              child: Image.asset(
                "assets/images/logo/favourite.png",
                height: 80.h,
                width: 80.w,
              ),
            ),
          10.verticalSpace,
            Flexible(
              flex: 1,
              child: Text(
                "Login to Save Favourites",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            20.verticalSpace,
            Flexible(flex: 2,
              child: Text(
                "To set a favourite location, first log in or\n sign up for an account.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            20.verticalSpace,
            Flexible(flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal:80.w),
                  // Responsive padding
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
