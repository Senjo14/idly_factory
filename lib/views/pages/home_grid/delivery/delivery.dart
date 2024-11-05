import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil

class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE3D7A6),
      appBar: AppBar(
        title: Text("Delivery"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0.w), // Use ScreenUtil for padding
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.h), // Use ScreenUtil for height
            Text(
              "Enter your address",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600), // Use ScreenUtil for font size
            ),
            SizedBox(height: 25.h), // Use ScreenUtil for height
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: "Delivery Address",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r), // Use ScreenUtil for border radius
                ),
              ),
            ),
            SizedBox(height: 15.h), // Use ScreenUtil for height
            Text(
              "Unit can be entered during checkout",
              style: TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.w200,
                fontSize: 16.sp, // Use ScreenUtil for font size
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20.h), // Use ScreenUtil for height
            Text.rich(
              TextSpan(
                text: "Delivery Terms and Fees Apply.\n",
                style: TextStyle(fontSize: 12.sp), // Use ScreenUtil for font size
                children: [
                  TextSpan(
                    text: "Click Here for Details.",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Details Clicked");
                      },
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h), // Use ScreenUtil for height
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h), // Use ScreenUtil for padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.r), // Use ScreenUtil for border radius
                ),
                side: BorderSide(
                  color: Colors.brown,
                  width: 0.5,
                ),
              ),
              onPressed: () {
                // Action when button is pressed
              },
              child: Text("Delivery Here"),
            ),
          ],
        ),
      ),
    );
  }
}
