

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../welcome_screen/welcome_screen.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();
  final pageController=PageController();
  Rx<int> currentIndex=0.obs;

  void updateCurrentIndex(index){
    currentIndex.value=index;
  }
  void dotNavigationClick(index){
    currentIndex.value=index;
    pageController.jumpTo(index);
  }
  void nextPage(){
    if(currentIndex.value == 2){
      Get.offAll(const WelcomeScreen());
    }else{
      int page=currentIndex.value+1;
      pageController.jumpToPage(page);
    }
  }
  void skipPage(){
    Get.offAll(const WelcomeScreen());
  }
}