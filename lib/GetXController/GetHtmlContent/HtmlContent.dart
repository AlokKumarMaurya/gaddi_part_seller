import 'package:flutter/cupertino.dart';
import 'package:gaddi_part_seller/apiClient/apiClient.dart';
import 'package:get/get.dart';

import '../../utils/modals/more_page/SellerReturnPoliciesModal.dart';
import '../../utils/modals/more_page/SellerSupportModal.dart';
import '../../utils/modals/policies.dart';

class HtmlContentData extends GetxController{
  var privacy_policy="".obs;
   var seller_support="".obs;
   var seller_return_policies="".obs;
@override
void onInit()async{
    debugPrint("HtmlContentData init called");
    getPrivacyPolicy();
    getSellerSuppoer();
    getSellerReturnPolicies();
}



  getPrivacyPolicy()async{
    SellerPolicies sellerPolicies;
    var response=await ApiClint().GetSellerPoliceis();
    if(response !=null){
          sellerPolicies=response;
          privacy_policy.value=sellerPolicies.data[0].content;
    }
  }


  getSellerSuppoer()async{
    SellerSupportModal sellerSupportModal;
    var response=await ApiClint().GetSellerSupport();
    if(response!=null){
      sellerSupportModal=response;
      seller_support.value=sellerSupportModal.data[0].content;
    }
  }

  getSellerReturnPolicies()async{
    SellerReturnPoliciesModal modal;
        var response=await ApiClint().GetSellerReturnPolicies();
        if(response!=null){
          modal=response;
            seller_return_policies.value=modal.data[0].content;
        }
  }
}