import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idly_factory/core/export.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 2,
      selectedItemColor: Colors.black87,
      unselectedItemColor: Colors.black,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedIconTheme: const IconThemeData(color: Colors.red),
      unselectedIconTheme: const IconThemeData(color: Colors.black),
      selectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.red),
      unselectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.black87),
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: const Icon(Icons.home_filled),
          label: AppStrings.home.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.document_scanner_outlined),
          label: AppStrings.scan.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.star_border_outlined),
          label: AppStrings.discover.tr,
        ),
      ],
      onTap: onTap,
    );
  }
}
