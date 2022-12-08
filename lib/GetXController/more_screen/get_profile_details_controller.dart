import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/GetXController/more_screen/profile_update_controller.dart';
import 'package:get/get.dart';

import '../../apiClient/apiClient.dart';
import '../../utils/modals/more_page/user_profile.dart';

class ProfileDetailsController extends GetxController{
 late UserProfile modal;

 @override
  void onInit() {
    // TODO: implement onInit
   getDetails();
    super.onInit();
  }


  void getDetails()async{
    var response=await ApiClint().GetUserDetails();
    if(response!=null){
      UserProfile  modal=response;
          this.modal=modal;
    }
  }


}