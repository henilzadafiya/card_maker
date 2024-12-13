import 'dart:async';

import 'package:card_maker/controller/home_screen_controller.dart';
import 'package:card_maker/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bottom_sheet_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  BottomSheetController bottomSheetController = Get.put(BottomSheetController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomSheetController.pages[bottomSheetController.currentIndex.value],
      bottomNavigationBar:BottomNavigationBar(
        selectedItemColor: Colors.yellow,
        currentIndex: bottomSheetController.currentIndex.value,
        onTap: (index) {
          setState(() {
            bottomSheetController.currentIndex.value = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
