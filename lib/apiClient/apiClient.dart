import 'dart:io';

import 'package:gaddi_part_seller/utils/all_order_list/allOrderListModal.dart';
import 'package:gaddi_part_seller/utils/app_constant.dart';
import 'package:gaddi_part_seller/utils/sharedPrefrences/sharedprefrences.dart';
import 'package:get/get.dart';
import '../GetXController/auth_controller/Getx_login.dart';
import '../GetXController/more_screen/add_product_controller.dart';
import '../helperWidget/snackbar.dart';
import '../utils/modals/dashboard/dashBoardData.dart';
import '../utils/modals/loginModal.dart';
import '../utils/modals/more_page/SellerReturnPoliciesModal.dart';
import '../utils/modals/more_page/SellerSupportModal.dart';
import '../utils/modals/more_page/profile_update.dart';
import '../utils/modals/more_page/user_profile.dart';
import '../utils/modals/policies.dart';
import '../utils/modals/signUpModal.dart';
import '../utils/modals/slider_modal.dart';
 import 'package:flutter/material.dart';
class ApiClint extends GetConnect{
  AuthController _authcontroller=Get.put(AuthController());
  SharedPrefrences sharedPrefrences=SharedPrefrences();
  AddProductController _addProductController=Get.put(AddProductController());

 LogInUser() async {
    var body={
      "email":_authcontroller.email,
      "password":_authcontroller.password
    };
    try{
      final res=await post(AppConstant.loginUrl,body);
     if(res.statusCode==200){
       LoginModal data=LoginModal.fromJson(res.body);
       return data;
     }
    }catch(e){
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

 SignUpUser()async{
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

  GetSellerSupport()async{
   try{
     final response=await get(AppConstant.policiesSupport);
     if(response.statusCode==200){
       SellerSupportModal modal=SellerSupportModal.fromJson(response.body);
       debugPrint(modal.data[0].content);
       return modal;
     }
   }catch(e){
     ShowCustomSnackbar().showSnackbar(e.toString());
   }
  }

  GetSellerReturnPolicies()async{
   try{
     final response=await get(AppConstant.policiesReturn);
     if(response.statusCode==200){
       SellerReturnPoliciesModal modal=SellerReturnPoliciesModal.fromJson(response.body);
       return modal;
     }
   }catch(e){
     ShowCustomSnackbar().showSnackbar(e.toString());
   }
  }

  GetSliders()async{
   try {
     final response=await get(AppConstant.slider);
     if(response!=null){
       SliderModal  modal=SliderModal.fromJson(response.body);
       debugPrint("modal.data.toString()");
       debugPrint(modal.data[0].photo);
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

  GetUserDetails()async{
    var token=sharedPrefrences.getToken();
    try{
      final response=await get(AppConstant.sellarDetail,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
         if(response.statusCode==200){
           UserProfile modal=UserProfile.fromJson(response.body);
           return modal;
         }
    }catch(e){
      ShowCustomSnackbar().showSnackbar(e.toString()) ;
    }
  }

  GetAllList()async{
    var token=sharedPrefrences.getToken();
   // try{
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

   // } catch(e){
   //   ShowCustomSnackbar().showSnackbar(e.toString());
   // }
  }

  UpdateProfile()async{
    var token=sharedPrefrences.getToken();
    var body={
    "phone":"9559901210",
    "new_password":"123456",
    "confirm_password":"123456",
    "name":"sandeep shop",
    "address":"gomtinagar lucknow",
    "country":"india",
    "city":"lucknow",
    "postal_code":"226030",
    "cash_on_delivery_status":"cash payment",
    "bank_payment_status":"",
    "bank_name":"",
    "bank_acc_name":"",
    "bank_acc_no":"",
    "bank_routing_no":""
    };
    try{
      final response=await post(AppConstant.updateProfile,body,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if(response.statusCode==200){
        ProfileUpdateModal modal=ProfileUpdateModal.fromJson(response.body);
        return  modal;
      }
    }catch(e){ShowCustomSnackbar().showSnackbar(e.toString());}
  }

  UploadProduct()async{
    var token=sharedPrefrences.getToken();
    var startDate="${_addProductController.startselectedDate.value.year}-${_addProductController.startselectedDate.value.month}-${_addProductController.startselectedDate.value.day}";
    var endDate="${_addProductController.endselectedDate.value.year}-${_addProductController.endselectedDate.value.month}-${_addProductController.endselectedDate.value.day}";
     Map body={
      "name":_addProductController.name.value,
      "added_by":"seller" ,
      "category_id":_addProductController.categoryId.value,
      "brand_id":_addProductController.barndId.value ,
      "barcode":"1" ,
      "refundable":_addProductController.isRefundable.value ,
       "photos":MultipartFile(File( _addProductController.imageFilePath.toString()), filename: _addProductController.imagePathString.toString()),
      "thumbnail_img":"MultipartFile(File(_addProductController.thumbnailFilePath.toString()),filename:_addProductController.thumbnailPathString.toString())",    //its file path not stirng
      "unit":_addProductController.unitPrice.value ,
      "min_qty":_addProductController.minQty.value,
      "low_stock_quantity":_addProductController.setAlert.value,
      "stock_visibility_state":_addProductController.stockVisible.value,
      "is_genuine":_addProductController.isGeniune.value ,
      "quality":_addProductController.quality.value ,
      "description":_addProductController.description.value,
      "video_provider":"youtube",
      "video_link":"http//fdnfjhfdbfhfdffdj",
      "unit_price":_addProductController.unitPrice.value ,
      "discount":_addProductController.discount.value,
      "discount_type":_addProductController.discountType.value,
      "date_range" :"${startDate} to ${endDate}",
      "shipping_type":_addProductController.shippingType.value ,
      "est_shipping_days":_addProductController.estimatedShippingDays.value ,
      "earn_point":_addProductController.earnPont.value,
      "flat_shipping_cost":_addProductController.amount.value,
      "tags":_addProductController.tags.value      ,
      "sku":_addProductController.sku.value ,
      "hsn":_addProductController.hsh.value,
      "current_stock":_addProductController.curentStock.value
    };

    try{

      
      var response=await post(AppConstant.sellarAddproduct, body,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },);
      debugPrint(response.body.toString());
      if(response.statusCode==200){
        var temp=(response.body);

        return  temp["message"];

      }
    } catch(e){
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }

}