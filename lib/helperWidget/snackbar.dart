import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowCustomSnackbar{
  void showSnackbar(String message){
    if(Get.isSnackbarOpen){
      Get.closeAllSnackbars();
    }
    Get.showSnackbar(
      GetSnackBar(
        duration: Duration(seconds: 2),
        message: message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      borderRadius: 12,
      isDismissible: true,
      dismissDirection: DismissDirection.endToStart,
      )
    );
  }
}