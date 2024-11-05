import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToggleButtonExample extends StatefulWidget {
  @override
  _ToggleButtonExampleState createState() => _ToggleButtonExampleState();
}

class _ToggleButtonExampleState extends State<ToggleButtonExample> {
  List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Set your design size here
      minTextAdapt: true,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Toggle Button Example',
              style: TextStyle(fontSize: 20.sp), // Responsive app bar title
            ),
          ),
          body: Center(
            child: ToggleButtons(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
                  child: Text(
                    'Button 1',
                    style: TextStyle(fontSize: 16.sp), // Responsive text size
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
                  child: Text(
                    'Button 2',
                    style: TextStyle(fontSize: 16.sp), // Responsive text size
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
                  child: Text(
                    'Button 3',
                    style: TextStyle(fontSize: 16.sp), // Responsive text size
                  ),
                ),
              ],
              isSelected: isSelected,
              onPressed: (int index) {
                setState(() {
                  isSelected[index] = !isSelected[index]; // Toggle the selection
                });
              },
              color: Colors.black,
              selectedColor: Colors.white,
              fillColor: Colors.blue,
              borderColor: Colors.grey,
              selectedBorderColor: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}
