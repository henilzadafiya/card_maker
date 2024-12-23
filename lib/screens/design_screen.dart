import 'dart:io';
import 'dart:typed_data';

import 'package:card_maker/controller/details_screen_controller.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import '../controller/bottom_sheet_controller.dart';
import '../controller/home_screen_controller.dart';

class DesignScreen extends StatefulWidget {
  String image;

  DesignScreen({required this.image});

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  DetailsScreenController detailsScreenController =
      Get.put(DetailsScreenController());

  dynamic image = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    image = homeScreenController.selectedIndex;
    homeScreenController.showList = false.obs;
  }

  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;
  BottomSheetController bottomSheetController =
      Get.put(BottomSheetController());
  final List<String> _names = ["નિલેશભાઈ લાલજીભાઈ ધડુક "];
  final TextEditingController _nameController = TextEditingController();
  File? _selectedImage;
  DateTime _selectedDate = DateTime.now(); // Initial date

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      currentDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _showNameManagerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Manage Names"),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _names.isEmpty
                      ? Text("No names added.")
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: _names.asMap().entries.map((entry) {
                                int index = entry.key;
                                String name = entry.value;
                                return ListTile(
                                  title: Text(
                                    name,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        _names.removeAt(
                                            index); // Updates the main list
                                      });
                                      setDialogState(
                                          () {}); // Updates the dialog UI
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Enter name",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          if (_nameController.text.isNotEmpty) {
                            setState(() {
                              _names.add(_nameController
                                  .text); // Updates the main list
                            });
                            setDialogState(() {}); // Updates the dialog UI
                            _nameController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  Color _textColor1 = Colors.blue; // Color for first text
  Color _textColor2 = Colors.grey; // Color for second text

  // Shared color picker function
  void _showColorPicker({
    required BuildContext context,
    required Color currentColor,
    required ValueChanged<Color> onColorSelected,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        Color tempColor = currentColor;
        return AlertDialog(
          title: Text("Pick a Color"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: tempColor,
              onColorChanged: (Color color) {
                tempColor = color;
              },
              showLabel: false,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                onColorSelected(tempColor); // Pass the selected color back
                Navigator.of(context).pop();
              },
              child: Text("Select"),
            ),
          ],
        );
      },
    );
  }

  BoxShape imageShape = BoxShape.circle;

  WidgetsToImageController controller = WidgetsToImageController();
// to save image bytes of widget
  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(_selectedDate);
    String dayOfWeek = DateFormat('EEEE').format(_selectedDate);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Card"),
      ),
      body: WidgetsToImage(
        controller: controller,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            // background
            Positioned(
              top: MediaQuery.of(context).size.height * 0.025,
              left: 0,
              right: 0,
              child: Obx(
                () => Image(
                    fit: BoxFit.contain,
                    image: AssetImage(
                        "images/cards/${homeScreenController.selectedIndex.value}.jpg")),
              ),
            ),
            //bottom bar
            Positioned(
              top: MediaQuery.of(context).size.height * 0.73,
              left: 0,
              right: 0,
              child: Obx(() {
                switch (bottomSheetController.designCurrentIndex.value) {
                  case 0:
                    return Obx(
                      () {
                        if (homeScreenController.showList.value) {
                          return Center(
                            child: Container(
                              height: 100,
                              // Set the height of the horizontal list
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: homeScreenController.cardList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      homeScreenController.selectBackground(
                                          index); // Update selected index
                                    },
                                    child: Obx(
                                      () => Container(
                                        width: 50,
                                        height: 50,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: homeScreenController
                                                        .selectedIndex.value ==
                                                    index
                                                ? Colors
                                                    .yellow // Highlight selected
                                                : Colors.transparent,
                                            // No border for unselected
                                            width: 3,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                            "${homeScreenController.cardList[index]}",
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    );
                  case 1:
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showColorPicker(
                                context: context,
                                currentColor: _textColor1,
                                onColorSelected: (color) {
                                  setState(() {
                                    _textColor1 = color; // Update the first color
                                  });
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "Select Title Color",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                          // SizedBox(height: 20),
                          // Second Text
                          GestureDetector(
                            onTap: () {
                              _showColorPicker(
                                context: context,
                                currentColor: _textColor2,
                                onColorSelected: (color) {
                                  setState(() {
                                    _textColor2 =
                                        color; // Update the second color
                                  });
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "Select Description Color",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  case 2:
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          if(imageShape == BoxShape.rectangle) {
                            imageShape = BoxShape.circle;
                          } else {
                            imageShape = BoxShape.rectangle;
                          }
                          setState(() {
        
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(imageShape == BoxShape.rectangle ?
                                              'Photo Circle' : 'Photo Rectangle',
                                              style: const TextStyle(color: Colors.white,fontSize: 18),
                                            ),
                        ),
                      )
                      // child: AnimatedButton(
                      //   // height: 70,
                      //   width: 200,
                      //   text: 'Settings Photo',
                      //   isReverse: true,
                      //   selectedTextColor: Colors.black,
                      //   transitionType: TransitionType.CENTER_ROUNDER,
                      //   textStyle: TextStyle(
                      //       fontSize: 14,
                      //       letterSpacing: 5,
                      //       color: Colors.deepOrange,
                      //       fontWeight: FontWeight.w300),
                      //   backgroundColor: Colors.black,
                      //   borderColor: Colors.white,
                      //   borderRadius: 50,
                      //   borderWidth: 2,
                      //   onPress: () {
                      //     if (imageShape == BoxShape.rectangle)
                      //       imageShape = BoxShape.circle;
                      //     else
                      //       imageShape = BoxShape.rectangle;
                      //     setState(() {});
                      //   },
                      // ),
                    );
                  case 3 :
                    return GestureDetector(
                      onTap: () async {
                          bytes = await controller.capture();
                          var path = await ExternalPath
                              .getExternalStoragePublicDirectory(
                              ExternalPath.DIRECTORY_DOWNLOADS) +
                              "/card maker";
                          Directory dir = Directory(path);
                          if (!await dir.exists()) {
                            dir.create();
                            // create image
                          }


                          String img_name =
                              "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}myimg.jpg";

                          File file = File("${dir.path}/${img_name}");
                          file.writeAsBytes(bytes!);
                          print("objectobjectobject :::${file.path}");
                          // Share.shareXFiles(['${file.path}'],
                          //     text: 'Great picture');
                          Share.shareXFiles([XFile('${file.path}')], text: 'Thank you for sharing my picture');
                      },
                      child: const Text(""),
                    );
                  default:
                    return Center(
                        child: Text(
                      'Unknown Screen',
                      style: TextStyle(color: Colors.white),
                    ));
                }
              }),
            ),
            // title text
            Positioned(
              top: MediaQuery.of(context).size.height * 0.075,
              left: 0,
              right: 0,
              child: Center(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: TextFormField(
                            controller: detailsScreenController.titleController,
                            autofocus: true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    detailsScreenController.titleController
                                        .clear();
                                  },
                                  icon: Icon(Icons.close)),
                              labelText: "Enter Text",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          title: const Text("Add title"),
                          actions: [
                            ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Update"))
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        detailsScreenController.titleController.text
                                .trim()
                                .isNotEmpty
                            ? "|| ${detailsScreenController.titleController.text.trim()} ||"
                            : "|| પ્રથમ વાર્ષિક પુણ્યતિથિ ||",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: _textColor1),
                      )),
                ),
              ),
            ),
            // image
            Positioned(
              top: MediaQuery.of(context).size.height * 0.11,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      // border: Border.all(width: 2,color: Colors.black,style: BorderStyle.solid),
                      // borderRadius: BorderRadius.circular(10),
                      shape: imageShape,
                      boxShadow: [
                        // Shadow at the top
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, -8),
                        ),
                        // Shadow on the right
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(8, 0),
                        ),
                        // Shadow at the bottom
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 8),
                        ),
                        // Shadow on the left
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(-8, 0),
                        ),
                      ],
                      color: Colors.red,
                      image: _selectedImage != null
                          ? DecorationImage(
                              image: FileImage(_selectedImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: _selectedImage == null
                        ? Icon(
                            Icons.account_circle_rounded,
                            color: Colors.white,
                            size: 40,
                          )
                        : null,
                  ),
                ),
              ),
            ),
            // right side diva
            Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                left: 0,
                right: MediaQuery.of(context).size.width / 1.7,
                child: Center(
                    child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/diya/diya.png'))),
                  height: 75,
                  width: 75,
                ))),
            // left side diva
            Positioned(
                top: MediaQuery.of(context).size.height * 0.15,
                right: 0,
                left: MediaQuery.of(context).size.width / 1.8,
                child: Center(
                    child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/diya/diya.png'))),
                  height: 75,
                  width: 75,
                ))),
            // name
            Positioned(
                top: MediaQuery.of(context).size.height * 0.31,
                left: 0,
                right: 0,
                child: Center(
                    child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: TextFormField(
                            controller: detailsScreenController.nameController,
                            autofocus: true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    detailsScreenController.nameController
                                        .clear();
                                  },
                                  icon: Icon(Icons.close)),
                              labelText: "Enter Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          title: const Text("Add Name"),
                          actions: [
                            ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Update"))
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        detailsScreenController.nameController.text
                                .trim()
                                .isNotEmpty
                            ? "સ્વ. ${detailsScreenController.nameController.text.trim()}"
                            : "સ્વ. લાલજીભાઈ ગોવિંદભાઈ ધડુક",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: _textColor1),
                      )),
                ))),
            // date select
            Positioned(
              top: MediaQuery.of(context).size.height * 0.34,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: _textColor2, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: GestureDetector(
                    onTap: _pickDate, // Trigger the date picker dialog
                    child: Text(
                      "Date: $formattedDate  Day: $dayOfWeek",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: _textColor2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // description
            Positioned(
                top: MediaQuery.of(context).size.height * 0.37,
                left: 0,
                right: 0,
                child: Center(
                    child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: TextFormField(
                            controller:
                                detailsScreenController.descriptionController,
                            autofocus: true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    detailsScreenController.descriptionController
                                        .clear();
                                  },
                                  icon: Icon(Icons.close)),
                              labelText: "Enter Description ",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          title: const Text("Add Description"),
                          actions: [
                            ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Update"))
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(
                        detailsScreenController.descriptionController.text
                                .trim()
                                .isNotEmpty
                            ? "${detailsScreenController.descriptionController.text.trim()}"
                            : "ના માંગતા બધું આપ્યું તમે, ન કહેતા બધું કર્યુ છે તમે,અમારા પ્રેમ અને સંસ્કારનું સિંચન કર્યુ છે તમે, કદી પિતાના રૂપે તો કદી મિત્ર સ્વરૂપે,તમારો હાથ અમારી ઉપર છે. સદા આર્શીવાદ રૂપે, પ્રભુ આપના દિવ્ય આત્મા ને શાંતિ અર્પે એ જ પ્રાર્થના.🙏",
                        style: TextStyle(
                          fontSize: 13,
                          color: _textColor2,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      )),
                ))),
            // son and family
            Positioned(
              top: MediaQuery.of(context).size.height * 0.56,
              left: MediaQuery.of(context).size.width * 0.2,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _showNameManagerDialog, // Show the name list dialog
                  child: Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
                    height: 120,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ListView.builder(
                      itemCount: _names.length < 5 ? _names.length : 5,
                      itemBuilder: (context, index) {
                        return Text(
                          "::  લી. ${_names[index]} ::",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: _textColor1,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Colors.yellow,
          // fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(color: Colors.white),
          showUnselectedLabels: true,
          currentIndex: bottomSheetController.designCurrentIndex.value,
          onTap: (index) async {
            bottomSheetController.designCurrentIndex.value = index;
            switch (index) {
              case 0:
                homeScreenController.showList.value =
                    !homeScreenController.showList.value;
              case 1:
                homeScreenController.showList.value = false;
            }

            print(bottomSheetController.designCurrentIndex.value);
            print(bottomSheetController.designCurrentIndex.value.runtimeType);
            if(bottomSheetController.designCurrentIndex.value == 3){
              homeScreenController.showList.value = false;
              bytes = await controller.capture();
              var path = await ExternalPath
                  .getExternalStoragePublicDirectory(
                  ExternalPath.DIRECTORY_DOWNLOADS) +
                  "/card maker";
              Directory dir = Directory(path);
              if (!await dir.exists()) {
            dir.create();
            // create image
            }


            String img_name =
            "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}myimg.jpg";

            File file = File("${dir.path}/${img_name}");
            file.writeAsBytes(bytes!);
            print("objectobjectobject :::${file.path}");
            // Share.shareXFiles(['${file.path}'],
            //     text: 'Great picture');
            Share.shareXFiles([XFile('${file.path}')], text: 'Great picture');
            }
          },
          items: bottomSheetController.designNavigationList(),
        ),
      ),
    );
  }
}
