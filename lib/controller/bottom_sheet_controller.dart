import 'package:card_maker/screens/settings_screen.dart';
import 'package:card_maker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/card_screen.dart';

class BottomSheetController extends GetxController {
  RxInt currentIndex = 0.obs;
  final List<Widget> pages = [
    CardScreen(), SettingsScreen()
    // Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    // Center(child: Text('Settings Page', style: TextStyle(fontSize: 24))),
  ];
}
