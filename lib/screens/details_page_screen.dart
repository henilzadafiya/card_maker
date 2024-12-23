import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/details_screen_controller.dart';

class DetailsPageScreen extends StatefulWidget {
  const DetailsPageScreen({super.key});

  @override
  State<DetailsPageScreen> createState() => _DetailsPageScreenState();
}

class _DetailsPageScreenState extends State<DetailsPageScreen> {
  DetailsScreenController detailsScreenController = Get.put(DetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: TextFormField(
              controller: detailsScreenController.titleController,
              decoration: InputDecoration(
                labelText: "Enter Text",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.snackbar(
                "Input Text",
                detailsScreenController.titleController.text,
                snackPosition: SnackPosition.BOTTOM,
              );
              Navigator.pop(context);
            },
            child: Text("Show Text"),
          ),
        ],
      ),
    );
  }
}
