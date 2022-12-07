import 'dart:convert';

import 'package:gaddi_part_seller/utils/all_order_list/allOrderListModal.dart';
import 'package:gaddi_part_seller/utils/app_constant.dart';
import 'package:gaddi_part_seller/utils/sharedPrefrences/sharedprefrences.dart';
import 'package:get/get.dart';
import '../GetXController/auth_controller/Getx_login.dart';
import '../helperWidget/snackbar.dart';
import '../utils/modals/dashboard/dashBoardData.dart';
import '../utils/modals/loginModal.dart';
import '../utils/modals/policies.dart';
import '../utils/modals/signUpModal.dart';
import '../utils/modals/slider_modal.dart';
 import 'package:flutter/material.dart';
class ApiClint extends GetConnect{
  AuthController _authcontroller=Get.put(AuthController());
  SharedPrefrences sharedPrefrences=SharedPrefrences();


 LogInUser() async {
    var body={
      "email":_authcontroller.email,
      "password":_authcontroller.password
    };
    try{
      final res=await post(AppConstant.loginUrl,body);
     if(res !=null){
       LoginModal data=LoginModal.fromJson(res.body);
       return data;
     }
    }catch(e){
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

 SignUpUser()async{
   debugPrint("test again");
   var body={
   "name":_authcontroller.Sname,
   "email":_authcontroller.Semail,
   "password":_authcontroller.Spassword,
   "phone":_authcontroller.Sphone,
   "register_by":"email"
   } ;
   try{
     final res=await post(AppConstant.signUp, body);
     if(res.statusCode==201){
       SignUpModal modal=SignUpModal.fromJson(res.body);
       debugPrint(modal.message);
       return modal;
     }
   }catch(e){
     ShowCustomSnackbar().showSnackbar(e.toString());
   }
 }

 GetSellerPoliceis()async{
   try{
     final response=await get(AppConstant.policies);
     if(response!=null){
       SellerPolicies modal=SellerPolicies.fromJson(response.body);
       return modal;
     }
   } catch(e){
     ShowCustomSnackbar().showSnackbar(e.toString());
   }
   
  }


  GetSliders()async{
   try {
     final response=await get(AppConstant.slider);
     if(response!=null){
       SliderModal  modal=SliderModal.fromJson(response.body);
       return modal;
     }
   }catch(e){
     ShowCustomSnackbar().showSnackbar(e.toString());
   }
  }

  GetDashBoardDetails()async{
    var id=sharedPrefrences.getId();
    var token=sharedPrefrences.getToken();
   try{
     final response=await get("${AppConstant.dashboardData}$id",headers: {
       'Content-Type': 'application/json',
       'Accept': 'application/json',
       'Authorization': 'Bearer $token',
     });
   print("DashboardModel"+response.body.toString())  ;
   if(response.statusCode==200){
       List<AllDashBoardData> modal=List<AllDashBoardData>.from(response.body.map((x) => AllDashBoardData.fromJson(x)));

           print("DashboardModel"+modal.toString())               ;


       return modal;
     }
  } catch(e){
     ShowCustomSnackbar().showSnackbar(e.toString());
   }
  }


  GetAllList()async{
    var token=sharedPrefrences.getToken();
   try{
     final response=await get(AppConstant.allOrderList,headers: {
       'Content-Type': 'application/json',
       'Accept': 'application/json',
       'Authorization': 'Bearer $token',
     }) ;
     debugPrint("response.body");
     debugPrint(response.body.toString());
     debugPrint(response.statusCode.toString());
     debugPrint("response.body");
     if(response.statusCode==200){
       AllOrderList modal=AllOrderList.fromJson(response.body);
       return modal;
     }

   } catch(e){
     ShowCustomSnackbar().showSnackbar(e.toString());
   }
  }
}