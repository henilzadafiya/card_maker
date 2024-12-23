import 'dart:async';

import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool loading = true.obs;
  RxBool showList = false.obs;
  // RxInt? selectBackground = 0.obs;
  var selectedIndex = (0).obs;
  RxList cardList = [
    'images/cards/0.jpg',
    'images/cards/1.jpg',
    'images/cards/2.jpg',
    'images/cards/3.jpg',
    'images/cards/4.jpg',
    'images/cards/5.jpg',
    'images/cards/6.jpg',
    'images/cards/7.jpg',
    'images/cards/8.jpg',
    'images/cards/9.jpg',
    'images/cards/10.jpg',
    'images/cards/11.jpg',
    'images/cards/12.jpg',
    // 'images/cards/13.jpg',
  ].obs;


  Future<void> startTimer() async {
    Timer(Duration(seconds: 3), () {
      loading=false.obs;
    },);
  }


  void selectBackground(int index) {
    selectedIndex.value = index; // Update the selected index
  }
  // RxInt fetchSelectBackground({int? index}){
  //   selectBackground = index as RxInt?;
  //   // print(index);
  //   // print(selectBackground);
  //   return selectBackground!;
  // }
  // RxInt fetchBackground(){
  //   // print(selectBackground);
  //   return selectBackground!;
  // }
}
