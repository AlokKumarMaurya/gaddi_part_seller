import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/apiClient/apiClient.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

import '../../helperWidget/snackbar.dart';
import '../../utils/modals/more_page/brand_list.dart';

class AddProductController extends GetxController {
  static AddProductController get to => Get.find<AddProductController>();

  var startselectedDate = DateTime.now().obs;
 var  endselectedDate =   DateTime.now().obs;
  final _picker = ImagePicker();
  File? imageFilePath;
  File? thumbnailFilePath;
  String? imagePathString;
  String? thumbnailPathString;
  TextEditingController textEditingController = TextEditingController();
   RxBool isAllFieldValid=false.obs;
  //add product text field controller
  var name = "".obs;
  var categoryId = "".obs;
  var barndId = "".obs;
  var isRefundable = "".obs;
  var isGeniune = "".obs;
  var minQty = "".obs;
  var setAlert = "".obs;
  var dateRange = "".obs;
  var stockVisible = "".obs;
  var quality = "".obs;
  var unitPrice = "".obs;
  var discountType = "".obs;
  var discount = "".obs;
  var earnPont = "".obs;
  var shippingType = "".obs;
  var estimatedShippingDays = "".obs;
  var amount = "".obs;
  var curentStock = "".obs;
  var tags = "".obs;
  var sku = "".obs;
  var hsh = "".obs;
  var description = "".obs;

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final text = textEditingController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    // return null if the text is valid
    return null;
  }

  void pickDate(String startOrEnd) async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: startselectedDate.value,
        //get today's date
        firstDate: DateTime.now(),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      if(startOrEnd=="Start") {
        startselectedDate.value = pickedDate!;
      }else{
        endselectedDate.value = pickedDate!;
      }

    }
  }
  

  void filePiker(String fileType) async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if (fileType == "Image") {
        imageFilePath = File(pickedFile.path);
        imagePathString = pickedFile.path;
        ShowCustomSnackbar().showSnackbar('Image selected.');
        print(imagePathString);
      } else if (fileType == "Thumbnail") {
        thumbnailFilePath = File(pickedFile.path);
        thumbnailPathString = pickedFile.path;
        ShowCustomSnackbar().showSnackbar('Thumbnail selected.');
        print(thumbnailPathString);
      }

      update();
    } else {
      ShowCustomSnackbar().showSnackbar('No image selected.');
      print('No image selected.');
    }
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    // TODO: implement update
    super.update(ids, condition);
  }

  void uploadProduct() async {
    Get.dialog(Container(
      height: 200,
      width: 200,
      color: Colors.transparent,child: Center(child: CircularProgressIndicator()),));
    checkValidationOfFields();

  }


   checkValidationOfFields() async {
    if(name.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter name first");
    }else if(categoryId.value=="Category ID"){
      ShowCustomSnackbar().showSnackbar("Select category first");
    }else if(barndId=="Select Brand"){
      ShowCustomSnackbar().showSnackbar("Select brand first");
    }   else if(isRefundable==""){
      ShowCustomSnackbar().showSnackbar("Select refundable type first");
    }  else if(isGeniune=="") {
      ShowCustomSnackbar().showSnackbar("Select geniune type");
    } else if(minQty.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter quantity first");
    }  else if(setAlert.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter alert quantity first");
    } else if(stockVisible==""){
      ShowCustomSnackbar().showSnackbar("Select stock visibility first");
    } else if(quality.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter quality first");
    }else if(unitPrice.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter unit price first");
    } else if(discountType==""){
      ShowCustomSnackbar().showSnackbar("Select discout type first");
    } else if(discount.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter discount first");
    }else if(earnPont==""){
      ShowCustomSnackbar().showSnackbar("Select earn point first");
    }  else if(shippingType==""){
      ShowCustomSnackbar().showSnackbar("Select shipping type first");
    } else if(imagePathString.isNullOrBlank!){
      ShowCustomSnackbar().showSnackbar("Select image first first");
    }else if(thumbnailPathString.isNullOrBlank!){
      ShowCustomSnackbar().showSnackbar("Select thumbnail first");
    }else if(estimatedShippingDays.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter estimated days of delivery first");
    } else if(amount.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter shipping cost first");
    }else if(curentStock.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter current stock first");
    }else if(tags.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter tags first");
    }else if(sku.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter sku first");
    }else if(hsh.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter hsh first");
    }else if(description.value.isEmpty){
      ShowCustomSnackbar().showSnackbar("Enter description first");
    } else {
    var response=await ApiClint().UploadProduct();
    if(response!=null){
      Get.back();
      Get.back();
      ShowCustomSnackbar().showSnackbar(response);
    }
    return isAllFieldValid.value=true;
  }
  }




  getAllBrandList()async{
    var response=await ApiClint().GetbrandList();
    BrandList modal=response;
  }
}
