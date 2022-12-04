import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomBarItemClick extends GetxController{
  var index=0.obs;
  var tabControl=0.obs;
      var selec_color=(Get.isDarkMode)?Colors.white:Colors.black.obs;
      var unselec_color=(Get.isDarkMode)?Colors.blue:Colors.black45.obs;

  void changeIndex(int ind,int tabVal){
    index.value=ind;
    tabControl.value=tabVal;
  }
}