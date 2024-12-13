import 'package:card_maker/widget/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_screen_controller.dart';

class DesignScreen extends StatefulWidget {
  String image;

  DesignScreen({required this.image});

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  dynamic image = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = homeScreenController.fetchBackground();
    homeScreenController.showList = false.obs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Card"),
      ),
      body:
          // Column(
          //   children: [

          // Expanded(child: Container(child: Image(fit: BoxFit.contain, image: AssetImage("${widget.image}")))),
          Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height * 0.025,
              left: 0,
              right: 0,
              child: Obx(
                () => Image(
                    fit: BoxFit.contain,
                    image: AssetImage("images/${image + 1}.jpg")),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              left: 0,
              right: 0,
              child: Center(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "|| પ્રથમ વાર્ષિક પુણ્યતિથિ ||",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )))),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.11,
              left: 0,
              right: 0,
              child: Center(
                  child: Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                color: Colors.red,
              ))),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.31,
              left: 0,
              right: 0,
              child: Center(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "સ્વ. લાલજીભાઈ ગોવિંદભાઈ ધડુક",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )))),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.34,
              left: 0,
              right: 0,
              child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        // Border properties
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width /1.5,
                      child: const Text(
                        "Date : 10/12/2022  Day : saturday",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown),
                      )))),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.36,
              left: 0,
              right: 0,
              child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: const Text(
                        "ના માંગતા બધું આપ્યું તમે, ન કહેતા બધું કર્યુ છે તમે,અમારા પ્રેમ અને સંસ્કારનું સિંચન કર્યુ છે તમે, કદી પિતાના રૂપે તો કદી મિત્ર સ્વરૂપે,તમારો હાથ અમારી ઉપર છે. સદા આર્શીવાદ રૂપે, પ્રભુ આપના દિવ્ય આત્મા ને શાંતિ અર્પે એ જ પ્રાર્થના.🙏",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.brown,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      )))),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.55,
              left: 0,
              right: 0,
              child: Center(
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: const Text(
                        ":: લી. નિલેશભાઈ લાલજીભાઈ ધડુક ::",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )))),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.575,
              left: 0,
              right: 0,
              child: Center(
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: const Text(
                        ":: લી. નિલેશભાઈ લાલજીભાઈ ધડુક ::",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )))),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.6,
              left: 0,
              right: 0,
              child: Center(
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: const Text(
                        ":: લી. નિલેશભાઈ લાલજીભાઈ ધડુક ::",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )))),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.85,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    homeScreenController.showList.value =
                        !homeScreenController.showList.value;
                  },
                  child: Column(
                    children: [
                      const Icon(Icons.card_giftcard),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: const Text("Card"),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Column(
                  children: [
                    const Icon(Icons.lightbulb),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: const Text("Diya"),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    const Icon(Icons.font_download_outlined),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: const Text("Font Size"),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    const Icon(Icons.linear_scale_rounded),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: const Text("space"),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    const Icon(Icons.details_outlined),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: const Text("Details"),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    const Icon(Icons.save),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: const Text("Save"),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Obx(
            () {
              if (homeScreenController.showList.value) {
                return Positioned(
                  top: MediaQuery.of(context).size.height * 0.72,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 100, // Set the height of the horizontal list
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeScreenController.cardList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              homeScreenController.selectBackground!
                                  .call(index); //!(index);

                              // dynamic select = homeScreenController.fetchBackground();
                              // print(select);
                            },
                            child: Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Image(
                                    height: MediaQuery.of(context).size.height *
                                        0.9,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    // fit: BoxFit.fitHeight,
                                    image: AssetImage(
                                        "${homeScreenController.cardList[index]}"))),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          )
          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.8,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Expanded(child: InkWell(
          //         onTap: () {
          //           print("object");
          //           setState(() {
          //             showList = !showList;
          //           });
          //         },
          //         child: Column(
          //           children: [
          //             const Icon(Icons.card_giftcard),
          //             Container(alignment: Alignment.bottomCenter,child: const Text("Card"),),
          //           ],
          //         ),
          //       )),
          //       Expanded(child: Column(
          //         children: [
          //           const Icon(Icons.lightbulb),
          //           Container(alignment: Alignment.bottomCenter,child: const Text("Diya"),),
          //         ],
          //       )),
          //       Expanded(child: Column(
          //         children: [
          //           const Icon(Icons.font_download_outlined),
          //           Container(alignment: Alignment.bottomCenter,child: const Text("Font Size"),),
          //         ],
          //       )),
          //       Expanded(child: Column(
          //         children: [
          //           const Icon(Icons.linear_scale_rounded),
          //           Container(alignment: Alignment.bottomCenter,child: const Text("space"),),
          //         ],
          //       )),
          //       Expanded(child: Column(
          //         children: [
          //           const Icon(Icons.details_outlined),
          //           Container(alignment: Alignment.bottomCenter,child: const Text("Details"),),
          //         ],
          //       )),
          //       Expanded(child: Column(
          //         children: [
          //           const Icon(Icons.save),
          //           Container(alignment: Alignment.bottomCenter,child: const Text("Save"),),
          //         ],
          //       )),
          //     ],
          //   ),
          // ),
        ],
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Expanded(child: InkWell(
      //       onTap: () {
      //         print("object");
      //         setState(() {
      //           showList = !showList;
      //         });
      //       },
      //       child: Column(
      //         children: [
      //           const Icon(Icons.card_giftcard),
      //           Container(alignment: Alignment.bottomCenter,child: const Text("Card"),),
      //         ],
      //       ),
      //     )),
      //     Expanded(child: Column(
      //       children: [
      //         const Icon(Icons.lightbulb),
      //         Container(alignment: Alignment.bottomCenter,child: const Text("Diya"),),
      //       ],
      //     )),
      //     Expanded(child: Column(
      //       children: [
      //         const Icon(Icons.font_download_outlined),
      //         Container(alignment: Alignment.bottomCenter,child: const Text("Font Size"),),
      //       ],
      //     )),
      //     Expanded(child: Column(
      //       children: [
      //         const Icon(Icons.linear_scale_rounded),
      //         Container(alignment: Alignment.bottomCenter,child: const Text("space"),),
      //       ],
      //     )),
      //     Expanded(child: Column(
      //       children: [
      //         const Icon(Icons.details_outlined),
      //         Container(alignment: Alignment.bottomCenter,child: const Text("Details"),),
      //       ],
      //     )),
      //     Expanded(child: Column(
      //       children: [
      //         const Icon(Icons.save),
      //         Container(alignment: Alignment.bottomCenter,child: const Text("Save"),),
      //       ],
      //     )),
      //   ],
      // ),
      // ],
      // ),

      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Expanded(child: ContainerWidget(color: Colors.red,)),
      //     Expanded(child: ContainerWidget(color: Colors.red,)),
      //     Expanded(child: ContainerWidget(color: Colors.red,)),
      //     Expanded(child: ContainerWidget(color: Colors.red,)),
      //     Expanded(child: ContainerWidget(color: Colors.red,)),
      //     Expanded(child: ContainerWidget(color: Colors.red,)),
      //   ],
      // ),
    );
  }
}
