import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idly_factory/view/screens/bottom_nav_screen/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../view/screens/homescreen/homescreen.dart';
import '../../../view/screens/intro_screens/learn_more_page.dart';


class BottomSheetController extends GetxController {
  var hasShownBottomSheet = false.obs;

  List<Map<String, String>> dataList = [
    {
      "iconPath": "assets/surprise-box.png",
      "text": "Earn points with every order to redeem\n free rewards."
    },
    {
      "iconPath": "assets/trophy.png",
      "text": "Enjoy a surprise gift on your birthday."
    },
    {
      "iconPath": "assets/coffee-app.png",
      "text": "Access contents and games to \nwin prizes."
    },
    {
      "iconPath": "assets/cards.png",
      "text": "Save time by ordering ahead for\n pickup or delivery."
    },
    {"iconPath": "assets/access.png", "text": "Get access to Times Financial."},
  ];

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
      await prefs.setBool('bottomSheetShown', true);
    }
  }


  void showBottomSheet(BuildContext context) {
    if (!hasShownBottomSheet.value) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        showDragHandle: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.85,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            "Join now",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Image.asset(
                          "assets/preview (2).webp",
                          height: 200,
                          width: 300,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Join now for exclusive benefits!",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              String iconPath = dataList[index]["iconPath"]!;
                              String text = dataList[index]["text"]!;

                              return Row(
                                children: [
                                  Image.asset(
                                    iconPath,
                                    width: 26,
                                    height: 26,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      text,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Get.to(LearnMorePage());
                        },
                        child: const Text(
                          "Learn More",
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
