import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idly_factory/widgets/common_widgets/ev_large_button.dart';

class ShopInfo extends StatelessWidget {
  ShopInfo({super.key});

  final List<String> days = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Shop Info", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shop Image
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/background/delivery.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Shop Address
                        Text(
                          "950 Railway Ave - unit 2",
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Save-on-Foods",
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                        ),
                        SizedBox(height: 8.h),
                        TextButton(
                          onPressed: () {
                            // Action for directions (e.g., open maps)
                          },
                          child: Text("Get Directions"),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Commonwealth Alberta",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        Text(
                          "Phone: 458-746-886",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(height: 12.h),

                        Divider(height: 0.5, thickness: 0.8, color: Colors.blueGrey),

                        SizedBox(height: 16.h),

                        Text(
                          "Ways To Order",
                          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                       Row(children: [
                         Icon(Icons.mobile_friendly_outlined),
                         SizedBox(width: 10.w),
                         Text("Mobile Ordering"),
                       ],),
                        SizedBox(height: 16.h),

                        Divider(height: 0.5, thickness: 0.8, color: Colors.blueGrey),
                        SizedBox(height: 12.h),

                        // Dine-in Hours
                        Text(
                          "Dine-in Hours",
                          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          // Wrap with Column to avoid scrolling and unnecessary padding
                          child: Column(
                            children: List.generate(days.length, (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      days[index],
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    Text(
                                      "7:00 a.m - 7:00 p.m",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80.h), // Space for bottom button container
                ],
              ),
            ),
            // Bottom Fixed Container with Order Button
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:Border(top: BorderSide(color: Colors.blueGrey)) ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical:10.h),

                child:EvLargeButton(text: "Order Here",onPressed: (){},)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
