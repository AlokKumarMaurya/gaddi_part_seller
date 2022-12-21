import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/apiClient/apiClient.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../helperWidget/snackbar.dart';
import '../../utils/modals/more_page/profile_update.dart';
import '../../utils/sharedPrefrences/sharedprefrences.dart';
import 'get_profile_details_controller.dart';

class ProfileUpdateController extends GetxController {
  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  final _picker = ImagePicker();
  RxString nameController = "${SharedPrefrences().getName()}".obs;
  var lastnameController = "test".obs;
  var emailController = SharedPrefrences().getEmail().obs;
  var phoneNumberController = SharedPrefrences().getPhone().obs;
  var newPasswordController = "".obs;
  var confirmPasswordController = "".obs;
  var addressController = "default".obs;
  var countryController = "default".obs;
  var cityController = "default".obs;
  var postalCodeController = "1111".obs;
  var bankNameController = "default".obs;
  var bankAccount_No_Controller = "1111".obs;
  Rx<File> imageFilePath = File("").obs;

  @override
  void onInit() {
    // TODO: implement onInit
    profileDetailsController.onInit();
    initializeValue();
    super.onInit();
  }

  void initializeValue() {
    nameController.value = "${SharedPrefrences().getName()}";
    bankNameController.value = "default";
    bankAccount_No_Controller.value = "1111";
    lastnameController.value = "test";
    emailController.value = SharedPrefrences().getEmail();
    phoneNumberController.value = SharedPrefrences().getPhone();
    newPasswordController.value = "";
    confirmPasswordController.value = "";
    addressController.value = "${profileDetailsController.modal.address}";
    countryController.value = "${profileDetailsController.modal.country}";
    cityController.value = "${profileDetailsController.modal.city}";
    postalCodeController.value = "${profileDetailsController.modal.postalCode}";
  }

  void verify() {
    debugPrint(lastnameController.value);
    if (nameController.value.isEmpty) {
      ShowCustomSnackbar().showSnackbar("Name cannot be blank");
    } else if (emailController.value.trim().isEmpty) {
      ShowCustomSnackbar().showSnackbar("Email cannot be empty");
    } else if (phoneNumberController.value.trim().isEmpty) {
      ShowCustomSnackbar().showSnackbar("Phone number cannot be empty");
    } else if (addressController.value.trim().isEmpty) {
      ShowCustomSnackbar().showSnackbar("Address cannot be empty");
    } else if (countryController.value.trim().isEmpty) {
      ShowCustomSnackbar().showSnackbar("Country cannot be empty");
    } else if (cityController.value.trim().isEmpty) {
      ShowCustomSnackbar().showSnackbar("City cannot be empty");
    } else if (postalCodeController.value.trim().isEmpty) {
      ShowCustomSnackbar().showSnackbar("Postal code cannot be empty");
    } else {
      updateProfile();
    }
  }

  void updateProfile() async {
    Get.dialog(Container(
      height: 200,
      width: 200,
      color: Colors.transparent,
      child: Center(child: CircularProgressIndicator()),
    ));
    var response = await ApiClint().UpdateProfile();
    if (response != null) {
      ProfileUpdateModal modal = response;
      Get.back();
      Get.back();
      ShowCustomSnackbar().showSnackbar(modal.message);
    }
  }

  void filePiker() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFilePath.value = File(pickedFile.path);
      ShowCustomSnackbar().showSnackbar('Image selected.');
    } else {
      ShowCustomSnackbar().showSnackbar('No image selected.');
    }
  }
}
