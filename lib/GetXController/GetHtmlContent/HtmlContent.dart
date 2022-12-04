import 'package:flutter/cupertino.dart';
import 'package:gaddi_part_seller/apiClient/apiClient.dart';
import 'package:get/get.dart';

import '../../utils/modals/policies.dart';

class HtmlContentData extends GetxController{
  var privacy_policy="".obs;


@override
void onInit()async{
    debugPrint("HtmlContentData init called");
    getPrivacyPolicy();
}



  getPrivacyPolicy()async{
    SellerPolicies sellerPolicies;
    var response=await ApiClint().GetSellerPoliceis();
    if(response !=null){
          sellerPolicies=response;
          privacy_policy.value=sellerPolicies.data[0].content;
    }
  }
}