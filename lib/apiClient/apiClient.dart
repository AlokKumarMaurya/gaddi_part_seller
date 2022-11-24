import 'dart:async';
import 'dart:convert';

import 'package:gaddi_part_seller/utils/app_constant.dart';
import 'package:get/get.dart';

import '../helperWidget/snackbar.dart';
import '../utils/modals/loginModal.dart';

class ApiClint extends GetConnect{
 LogInUser(String email,String password) async {
    //var api=Uri.parse(AppConstant.LOGIN_URL);
    var body={
      "user_type":"seller",
      "email":email,
      "password":password
    };
    try{
      final res=await post(AppConstant.LOGIN_URL,body);
     if(res !=null){
       print("1212122121221221");
       print(res.body);
       LoginModal data=LoginModal.fromJson(res.body);
       return data;
     }
    }catch(e){
      print(e.toString());
      ShowCustomSnackbar().showSnackbar(e.toString());
    }

  }
}