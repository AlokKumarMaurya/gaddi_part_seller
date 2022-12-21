import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/apiClient/apiClient.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/all_order_list/allOrderListModal.dart';
import '../../utils/modals/dashboard/dashBoardData.dart';
import '../../utils/modals/slider_modal.dart';

class DashboardController extends GetxController {
  RxList<Datum> sliderContent=<Datum>[].obs ;
  RxInt slidePageController=0.obs;
  RxList<AllDashBoardData> allDashBoard=<AllDashBoardData>[].obs;
  RxBool isDataLoaded=false.obs;
// late   PageController pageController=PageController(keepPage: false, initialPage:slidePageController.value);

  @override
  void onInit() {
    // TODO: implement onInit
    getSlider();
    getAllDashBoardDetails();

    super.onInit();
  }

  void getSlider() async {
    var response = await ApiClint().GetSliders();
    if (response != null) {
      SliderModal modal = response;
      debugPrint(modal.toString());
      debugPrint("modal.toString()");
      sliderContent.addAll(modal.data);
    }
    sliderController();
  }

  void sliderController(){
    Timer.periodic(Duration(seconds: 3), (timer) {
      if(slidePageController.value ==sliderContent.length) {
        slidePageController.value=0;
        // pageController.jumpTo(slidePageController.value.toDouble());
      }else{
        debugPrint("slidePageController.value.toString()");
        debugPrint(slidePageController.value.toString());
        slidePageController.value=slidePageController.value+1;
        // pageController.jumpTo(slidePageController.value.toDouble());
      }
      // pageController.jumpTo(slidePageController.value.toDouble());
    });
  }

  void getAllDashBoardDetails()async{
        var response=await ApiClint().GetDashBoardDetails();
        if(response !=null){
           allDashBoard.value=response;
        }
  }


}
