import 'package:card_maker/screens/design_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_screen_controller.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Card"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
        itemCount: homeScreenController.cardList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(DesignScreen(image: homeScreenController.cardList[index]), arguments: index);
              homeScreenController.selectBackground!(index);
            },
            child: Image(
                fit: BoxFit.contain,
                image: AssetImage("${homeScreenController.cardList[index]}")),
          );
        },
      ),
    );
  }
}
