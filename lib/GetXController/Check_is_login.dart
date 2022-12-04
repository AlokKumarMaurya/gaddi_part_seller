import 'package:gaddi_part_seller/utils/sharedPrefrences/sharedprefrences.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CheckIfLogin extends GetxController{
  GetStorage gs=GetStorage();
  var isLoggedIn=false.obs;
  var token="".obs;
  void checklogin(){
    var temp=gs.read(SharedPrefrences.token);
        if(temp !=null || temp !=""){
          isLoggedIn.value=true;
        }
  }

  @override
  void onInit() {
    checklogin();
    // TODO: implement onInit
    super.onInit();
  }

}