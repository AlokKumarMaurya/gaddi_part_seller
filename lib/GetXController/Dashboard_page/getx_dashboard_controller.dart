import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/apiClient/apiClient.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/all_order_list/allOrderListModal.dart';
import '../../utils/modals/dashboard/dashBoardData.dart';
import '../../utils/modals/slider_modal.dart';

class DashboardController extends GetxController {
  RxList sliderContent=[].obs ;
  RxInt slidePageController=0.obs;
  RxList<AllDashBoardData> allDashBoard=<AllDashBoardData>[].obs;
  RxBool isDataLoaded=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getSlider();
    getAllDashBoardDetails();
    getOrderList();
    super.onInit();
  }

  void getSlider() async {
    var response = await ApiClint().GetSliders();
    if (response != null) {
      SliderModal modal = response;
      sliderContent.addAll(modal.data);
    }
    sliderController();
  }

  void sliderController(){
    PageController _pageController=PageController(keepPage: false, initialPage: slidePageController.value);
    Timer.periodic(Duration(seconds: 3), (timer) {
      if(slidePageController.value ==sliderContent.length) {
        slidePageController.value=0;
      }else{
        slidePageController.value++;
      }
    });
  }

  void getAllDashBoardDetails()async{
        var response=await ApiClint().GetDashBoardDetails();
        if(response !=null){
           allDashBoard.value=response;
        }
  }

  void getOrderList()async{
       var response=await ApiClint().GetAllList() ;
       if(response!=null){
         AllOrderList modal=response;
        // debugPrint(modal.order.length.toString());
       }
  }
}