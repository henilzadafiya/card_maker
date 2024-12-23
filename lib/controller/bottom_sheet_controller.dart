import 'package:card_maker/screens/settings_screen.dart';
import 'package:card_maker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/card_screen.dart';

class BottomSheetController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt designCurrentIndex = 0.obs;
  final List<Widget> pages = [
    CardScreen(), SettingsScreen()
    // Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    // Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
  ];

   List<BottomNavigationBarItem> designNavigationList() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Card'),
      // BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'Diya'),
      BottomNavigationBarItem(icon: Icon(Icons.font_download_outlined), label: 'Font Color'),
      BottomNavigationBarItem(icon: Icon(Icons.linear_scale_rounded), label: 'Photo'),
      // BottomNavigationBarItem(icon: Icon(Icons.details_outlined), label: 'Details'),
      BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Save'),
    ];
  }
}
