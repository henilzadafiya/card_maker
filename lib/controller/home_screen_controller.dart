import 'dart:async';

import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool loading = true.obs;
  RxBool showList = false.obs;
  RxInt? selectBackground = 0.obs;
  RxList cardList = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/5.jpg',
    'images/6.jpg',
    'images/7.jpg',
    'images/8.jpg',
    'images/9.jpg',
    'images/10.jpg',
    'images/11.jpg',
    'images/12.jpg',
    'images/13.jpg',
    'images/14.jpg',
  ].obs;


  Future<void> startTimer() async {
    Timer(Duration(seconds: 3), () {
      loading=false.obs;
    },);
  }



  RxInt fetchSelectBackground({int? index}){
    selectBackground = index as RxInt?;
    // print(index);
    // print(selectBackground);
    return selectBackground!;
  }
  RxInt fetchBackground(){
    // print(selectBackground);
    return selectBackground!;
  }
}
