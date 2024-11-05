import 'package:flutter/material.dart';
import 'package:idly_factory/core/export.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final BottomSheetController bottomSheetController = Get.put(BottomSheetController());

  int selectedIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    Scan(),
    Discover(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndShowBottomSheet();
    });
  }

  void _checkAndShowBottomSheet() {
    if (selectedIndex == 0 && !bottomSheetController.hasShownBottomSheet.value) {
      bottomSheetController.showBottomSheet(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black,
        iconSize: 30,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 0) {
            _checkAndShowBottomSheet();
          }
        },
        selectedIconTheme: const IconThemeData(color: Colors.red),
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        selectedLabelStyle: TextStyle(fontSize: 12.sp, color: Colors.red),
        unselectedLabelStyle: TextStyle(fontSize: 12.sp, color: Colors.black87),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: const Icon(Icons.home_filled),
            label: AppStrings.home.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.scanner),
            label: AppStrings.scan.tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore),
            label: AppStrings.discover.tr,
          ),
        ],
      ),
    );
  }
}
