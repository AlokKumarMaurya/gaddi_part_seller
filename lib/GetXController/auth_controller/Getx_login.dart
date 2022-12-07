import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apiClient/apiClient.dart';
import '../../helperWidget/snackbar.dart';
import '../../utils/modals/loginModal.dart';
import '../../utils/modals/signUpModal.dart';
import '../../utils/sharedPrefrences/sharedprefrences.dart';

class AuthController extends GetxController {
  RxBool  isSessionStarted=false.obs;
  RxBool isVisible = true.obs;
  RxBool isRemberOn = false.obs;
  var email;
  var password;
  String? Sname;
  String? Semail;
  String? Sphone;
  String? Spassword;
  ShowCustomSnackbar snackbar =  ShowCustomSnackbar();

  void loginUser() {
    if (email == null) {
      snackbar.showSnackbar("Enter email first");
    } else if (password == null) {
      snackbar.showSnackbar("Enter email");
    } else {
      isSessionStarted.value=true;
      login();
    }
  }

  void login() async {
    LoginModal modal;
    var response = await ApiClint().LogInUser();
    if (response != null) {
      isSessionStarted.value=false;
      modal = response;
      debugPrint(modal.accessToken);
      if (modal.accessToken !=null) {
        SharedPrefrences().saveToken(modal.accessToken);
        SharedPrefrences().saveId(modal.user.id.toString());
        SharedPrefrences().saveName(modal.user.name);
        SharedPrefrences().saveEmail(modal.user.email);
        SharedPrefrences().saveAvatar((modal.user.avatar != null) ? modal.user.avatar : "");
        SharedPrefrences().savePhone(modal.user.phone);

        Get.offNamed("/NavigationBarScreen");
      }
    }
    isSessionStarted.value=false;
  }


  void SignUpUser(){
    if(Sname==null){
      snackbar.showSnackbar("Enter correct name");
    } else if(Semail==null){
      snackbar.showSnackbar("Enter email first");
    }else if(Sphone==null){
      snackbar.showSnackbar("Enter correct number");
    }else if(Spassword==null){
      snackbar.showSnackbar("Enter password");
    } else if(Spassword!.length <6){
      snackbar.showSnackbar("Password must be of atleast 6 words");
    }else{
      isSessionStarted.value=true;
      debugPrint("test");
       signUp();
    }
  }
  void signUp()async{
    SignUpModal modal;
    var response=await ApiClint().SignUpUser();
    if(response !=null){
      isSessionStarted.value=false;
      modal=response;
      ShowCustomSnackbar().showSnackbar(modal.message);
      Get.offAllNamed("/Login");
    }
    isSessionStarted.value=false;
  }
}
