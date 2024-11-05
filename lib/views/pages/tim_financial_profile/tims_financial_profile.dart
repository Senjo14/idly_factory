import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idly_factory/widgets/common_widgets/ev_large_button.dart';
import '../../screens/discover_screen/discover.dart';
import '../../screens/homescreen/homescreen.dart';
import '../../screens/scan/scan.dart';
import 'circular_stepper.dart';

class TimsFinancialProfile extends StatefulWidget {
  TimsFinancialProfile({super.key});

  @override
  State<TimsFinancialProfile> createState() => _TimsFinancialProfileState();
}

class _TimsFinancialProfileState extends State<TimsFinancialProfile> {
  double currentPercentage = 0.2;
  int selectedIndex = 0;
  bool isVisible = false;
  String password = '';

  bool get isPasswordMinLength => password.length >= 8;
  bool get hasNumber => password.contains(RegExp(r'[0-9]'));
  bool get hasSymbol => password.contains(RegExp(r'[!@#\$&*~]'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Tims Financial profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                CustomPaint(
                  size: Size(25, 25),
                  painter: CircularStepperPainter(percentage: currentPercentage),
                ),
                SizedBox(width: 10),
                Text("Step ${1} of ${5}"),
              ],
            ),
            SizedBox(height: 20),
            Text("Create Password", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("New Password", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter your password",
                suffixIcon: IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              obscureText: !isVisible,
            ),
            SizedBox(height: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildPasswordCondition("Minimum 8 characters", isPasswordMinLength),
                _buildPasswordCondition("At least one number", hasNumber),
                _buildPasswordCondition("At least one symbol (e.g. !@#\$&*)", hasSymbol),
              ],
            ),
            Spacer(),
            Center(
              child: EvLargeButton(
                padding: EdgeInsets.symmetric(horizontal: 120.w,vertical: 12.h),
                onPressed: () {
                  setState(() {
                    if (currentPercentage < 1.0) {
                      currentPercentage += 0.2;
                    }
                  });
                },
                text: "Next Step",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordCondition(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : Colors.red,
          size: 20,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            color: isValid ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
