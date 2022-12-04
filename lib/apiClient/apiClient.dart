import 'package:gaddi_part_seller/utils/app_constant.dart';
import 'package:get/get.dart';
import '../helperWidget/snackbar.dart';
import '../utils/modals/loginModal.dart';
import '../utils/modals/policies.dart';

class ApiClint extends GetConnect{


 LogInUser(String email,String password) async {
    var body={
      "email":email,
      "password":password
    };
    try{
      final res=await post(AppConstant.LOGIN_URL,body);
     if(res !=null){
       LoginModal data=LoginModal.fromJson(res.body);
       return data;
     }
    }catch(e){
      ShowCustomSnackbar().showSnackbar(e.toString());
    }
  }


  GetSellerPoliceis()async{
   try{
     final response=await get(AppConstant.POLICIES);
     if(response!=null){
       SellerPolicies modal=SellerPolicies.fromJson(response.body);
       return modal;
     }
   } catch(e){
     ShowCustomSnackbar().showSnackbar(e.toString());
   }
   
  }


}