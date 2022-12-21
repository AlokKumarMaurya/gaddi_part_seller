import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/utils/all_order_list/allOrderListModal.dart';
import 'package:gaddi_part_seller/utils/app_constant.dart';
import 'package:gaddi_part_seller/utils/sharedPrefrences/sharedprefrences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import '../GetXController/auth_controller/Getx_login.dart';
import '../GetXController/more_screen/add_product_controller.dart';
import '../GetXController/more_screen/profile_update_controller.dart';
import '../helperWidget/snackbar.dart';
import '../utils/modals/dashboard/dashBoardData.dart';
import '../utils/modals/loginModal.dart';
import '../utils/modals/more_page/SellerReturnPoliciesModal.dart';
import '../utils/modals/more_page/SellerSupportModal.dart';
import '../utils/modals/more_page/brand_list.dart';
import '../utils/modals/more_page/profile_update.dart';
import '../utils/modals/more_page/user_profile.dart';
import '../utils/modals/policies.dart';
import '../utils/modals/signUpModal.dart';
import '../utils/modals/slider_modal.dart';

class ApiClint extends GetConnect {
  AuthController _authcontroller = Get.put(AuthController());
  SharedPrefrences sharedPrefrences = SharedPrefrences();
  AddProductController _addProductController = Get.put(AddProductController());

  LogInUser() async {
    var body = {
      "email": _authcontroller.email,
      "password": _authcontroller.password
    };
    try {
      final res = await http.post(Uri.parse(AppConstant.loginUrl), body:body);
      debugPrint(res.body.toString());
      if (res.statusCode == 200) {
        LoginModal data = LoginModal.fromJson(jsonDecode(res.body));
        return data;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  SignUpUser() async {
    var body = {
      "name": _authcontroller.Sname,
      "email": _authcontroller.Semail,
      "password": _authcontroller.Spassword,
      "phone": _authcontroller.Sphone,
      "register_by": "email"
    };
    try {
      final res = await http.post(Uri.parse(AppConstant.signUp),body: body);
      if (res.statusCode == 201) {
        SignUpModal modal = SignUpModal.fromJson(jsonDecode(res.body));
        debugPrint(modal.message);
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  GetSellerPoliceis() async {
    try {
      final response = await http.get(Uri.parse(AppConstant.policies));
      if (response != null) {
        SellerPolicies modal = SellerPolicies.fromJson(jsonDecode(response.body));
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  GetSellerSupport() async {
    try {
      final response = await http.get(Uri.parse(AppConstant.policiesSupport));
      if (response.statusCode == 200) {
        SellerSupportModal modal = SellerSupportModal.fromJson(jsonDecode(response.body));
        debugPrint(modal.data[0].content);
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  GetSellerReturnPolicies() async {
    try {
      final response = await http.get(Uri.parse(AppConstant.policiesReturn));
      if (response.statusCode == 200) {
        SellerReturnPoliciesModal modal =
            SellerReturnPoliciesModal.fromJson(jsonDecode(response.body));
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  GetSliders() async {
    try {
      final response = await http.get(Uri.parse(AppConstant.slider));
      if (response != null) {
        SliderModal modal = SliderModal.fromJson(jsonDecode(response.body));
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  GetDashBoardDetails() async {
    var id = sharedPrefrences.getId();
    var token = sharedPrefrences.getToken();
    try {
      final response = await get("${AppConstant.dashboardData}$id", headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print("DashboardModel" + response.body.toString());
      if (response.statusCode == 200) {
        List<AllDashBoardData> modal = List<AllDashBoardData>.from(
            response.body.map((x) => AllDashBoardData.fromJson(x)));
        print("DashboardModel" + modal.toString());
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  GetUserDetails() async {
    var token = sharedPrefrences.getToken();
    try {
      final response = await http.get(Uri.parse(AppConstant.sellarDetail), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        UserProfile modal = UserProfile.fromJson(jsonDecode(response.body));
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  GetAllList() async {
    var token = sharedPrefrences.getToken();
    debugPrint(token.toString());
    debugPrint("00000000000000000000000");
    try {
      final response = await http.get(Uri.parse(AppConstant.allOrderList), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      debugPrint("response.body");
      debugPrint(response.body.toString());
      debugPrint(response.statusCode.toString());
      debugPrint("response.body");
      if (response.statusCode == 200) {
        AllOrderList modal = AllOrderList.fromJson(jsonDecode(response.body));
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  UpdateProfile() async {
    ProfileUpdateController _profile = Get.put(ProfileUpdateController());
    var token = sharedPrefrences.getToken();
    var body = FormData({
      "phone": _profile.phoneNumberController.value,
      "new_password": _profile.newPasswordController.value ?? "",
      "confirm_password": _profile.confirmPasswordController.value ?? "",
      "name": _profile.nameController.value,
      "address": _profile.addressController.value,
      "country": _profile.countryController.value,
      "city": _profile.cityController.value,
      "postal_code": _profile.postalCodeController.value,
      "cash_on_delivery_status": "cash payment",
      "bank_payment_status": "",
      "bank_name": "",
      "bank_acc_name": "",
      "bank_acc_no": "",
      "bank_routing_no": "",
      "photo": await MultipartFile(File(_profile.imageFilePath.value.path),
          filename: _profile.imageFilePath.value.path)
    });
    try {
      final response = await http.post(Uri.parse(AppConstant.updateProfile),body: body, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        ProfileUpdateModal modal = ProfileUpdateModal.fromJson(jsonDecode(response.body));
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  UploadProduct() async {
    var token = sharedPrefrences.getToken();
    var startDate =
        "${_addProductController.startselectedDate.value.year}-${_addProductController.startselectedDate.value.month}-${_addProductController.startselectedDate.value.day}";
    var endDate =
        "${_addProductController.endselectedDate.value.year}-${_addProductController.endselectedDate.value.month}-${_addProductController.endselectedDate.value.day}";
    var body = FormData({
      "name": _addProductController.name.value,
      "added_by": "seller",
      "category_id": _addProductController.categoryId.value,
      "brand_id": _addProductController.barndId.value,
      "barcode": "1",
      "refundable": _addProductController.isRefundable.value,
      "unit": _addProductController.unitPrice.value,
      "min_qty": _addProductController.minQty.value,
      "low_stock_quantity": _addProductController.setAlert.value,
      "stock_visibility_state": _addProductController.stockVisible.value,
      "is_genuine": _addProductController.isGeniune.value,
      "quality": _addProductController.quality.value,
      "description": _addProductController.description.value,
      "video_provider": "youtube",
      "video_link": "http//fdnfjhfdbfhfdffdj",
      "unit_price": _addProductController.unitPrice.value,
      "discount": _addProductController.discount.value,
      "discount_type": _addProductController.discountType.value,
      "date_range": "${startDate} to ${endDate}",
      "shipping_type": _addProductController.shippingType.value,
      "est_shipping_days": _addProductController.estimatedShippingDays.value,
      "earn_point": _addProductController.earnPont.value,
      "flat_shipping_cost": _addProductController.amount.value,
      "tags": _addProductController.tags.value,
      "sku": _addProductController.sku.value,
      "hsn": _addProductController.hsh.value,
      "current_stock": _addProductController.curentStock.value,
      "photos": await MultipartFile(
          File(_addProductController.imageFilePath!.path),
          filename: _addProductController.imageFilePath!.path),
      "thumbnail_img": await MultipartFile(
          File(_addProductController.thumbnailFilePath!.path),
          filename: _addProductController.thumbnailFilePath!.path),
    });
    try {
      final response = await http.post(
        Uri.parse(AppConstant.sellarAddproduct),
        body:body,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body);
        return temp["message"];
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

  GetbrandList() async {
    var token = await sharedPrefrences.getToken();
    try {
      var response = await http.get(Uri.parse(AppConstant.brandList), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        BrandList modal = BrandList.fromJson(jsonDecode(response.body));
        return modal;
      }
    } catch (e) {
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }
}
