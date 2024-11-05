import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:idly_factory/constants/text_styles.dart';


class FinancialContainer extends StatefulWidget {
  const FinancialContainer({Key? key}) : super(key: key);

  @override
  _FinancialContainerState createState() => _FinancialContainerState();
}

class _FinancialContainerState extends State<FinancialContainer> {
  bool isOrderMode = false;
  DateTime? lastUsed;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>Get.toNamed("/timFinancial") ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        width: 150.w,
        height: 140.h,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Text(
                   "Idly Financial",
                  style: AppTextStyle.bodyText,
                ),
              ),
              Flexible(
                flex: 3,
                child: Image.asset(
                  "assets/images/logo/card.png",
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                flex:2,
                child: Text(
                  "More ways to earn with Idly",
                  style: AppTextStyle.smallText,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON decoding

Future<void> _checkLastUsage() async {
  try {
    // Step 1: Fetch last usage date from backend
    final response = await http.get(
      Uri.parse('https://api.example.com/user/last-usage'),
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN_HERE', // Add authentication if needed
      },
    );

    if (response.statusCode == 200) {
      // Parse response from backend
      final responseData = json.decode(response.body);
      String lastUsedString = responseData['last_used_date'];
      lastUsed = DateFormat('yyyy-MM-dd').parse(lastUsedString);

      // Step 2: Compare dates and determine mode
      if (DateTime.now().difference(lastUsed!).inDays >= 7) {
        setState(() {
          isOrderMode = true; // Switch to "Order" mode after a week
        });
      }

      // Optionally, store last usage locally
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('lastUsedDate', lastUsedString);
    } else {
      // Handle error response from backend
      print("Failed to fetch last usage date from server");
    }
  } catch (error) {
    // Fallback to local data if there's an error or no internet
    print("Error fetching last usage: $error");
    await _checkLocalLastUsage();
  }

  // Step 3: Update last used date on the backend
  await _updateLastUsedOnBackend();
}

// Fallback method to check locally stored last usage
Future<void> _checkLocalLastUsage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? lastUsedString = prefs.getString('lastUsedDate');

  if (lastUsedString != null) {
    lastUsed = DateFormat('yyyy-MM-dd').parse(lastUsedString);
    if (DateTime.now().difference(lastUsed!).inDays >= 7) {
      setState(() {
        isOrderMode = true;
      });
    }
  }
}

// Update last usage on the backend (called every time app is accessed)
Future<void> _updateLastUsedOnBackend() async {
  try {
    final response = await http.post(
      Uri.parse('https://api.example.com/user/update-last-usage'),
      headers: {
        'Authorization': 'Bearer YOUR_TOKEN_HERE',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'last_used_date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
      }),
    );

    if (response.statusCode == 200) {
      print("Last usage updated successfully on backend");
    } else {
      print("Failed to update last usage on backend");
    }
  } catch (error) {
    print("Error updating last usage on backend: $error");
  }
}

 */
