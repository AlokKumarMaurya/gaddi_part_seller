import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/apiClient/apiClient.dart';
import 'package:get/get.dart';

import '../../helperWidget/snackbar.dart';
import '../../utils/modals/more_page/profile_update.dart';
import '../../utils/sharedPrefrences/sharedprefrences.dart';

class ProfileUpdateController extends GetxController{
  RxString nameController="${SharedPrefrences().getName()}".obs;
  var lastnameController="test".obs;
  var emailController=SharedPrefrences().getEmail().obs;
  var phoneNumberController=SharedPrefrences().getPhone().obs;
  var newPasswordController="1111".obs;
  var confirmPasswordController="111".obs;
  var addressController="default".obs;
  var countryController="default".obs;
  var cityController="default".obs;
  var postalCodeController="1111".obs;
  var bankNameController="default".obs;
  var bankAccount_No_Controller="1111".obs;



  @override
  void onInit() {
    // TODO: implement onInit
    initializeValue();
    super.onInit();
  }
  void initializeValue(){
    nameController.value="${SharedPrefrences().getName()}";
    bankNameController.value="default";
    bankAccount_No_Controller.value="1111";
    lastnameController.value="test";
    emailController.value=SharedPrefrences().getEmail();
    phoneNumberController.value=SharedPrefrences().getPhone();
    newPasswordController.value="1111";
    confirmPasswordController.value="111";
    addressController.value="default";
   countryController.value="default";
   cityController.value="default";
   postalCodeController.value="1111";
  }

  void verify(){
    debugPrint(lastnameController.value);
    if(nameController.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Name cannot be blank");
    }else if(lastnameController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Last name cannot be empty");
    }else if(emailController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Email cannot be empty");
    }else if(phoneNumberController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Phone number cannot be empty");
    }else if(newPasswordController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Password cannot be empty");
    }else if(confirmPasswordController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Confirm password must be same as password");
    }else if(addressController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Address cannot be empty");
    }else if(countryController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Country cannot be empty");
    }else if(cityController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("City cannot be empty");
    }else if(postalCodeController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Postal code cannot be empty");
    }else if(bankNameController.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Bnak name cannot be empty");
    }else if(bankAccount_No_Controller.value.trim().isEmpty){
      ShowCustomSnackbar().showSnackbar("Account number cannot be empty cannot be empty");
    }else {
      updateProfile();
    }
  }
  void updateProfile()async{
    var response=await ApiClint().UpdateProfile();
    if(response!=null){
      ProfileUpdateModal modal=response;
      Get.back();
      Get.back();
      ShowCustomSnackbar().showSnackbar(modal.message);
    }
  }

}
