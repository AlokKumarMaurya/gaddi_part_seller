import 'package:get/get.dart';
import '../apiClient/apiClient.dart';
import '../helperWidget/snackbar.dart';
import '../utils/modals/loginModal.dart';
import '../utils/sharedPrefrences/sharedprefrences.dart';

class GetxLogin extends GetxController {
  RxBool isVisible = true.obs;
  RxBool isRemberOn = false.obs;
  var email;
  var password;
  ShowCustomSnackbar snackbar = new ShowCustomSnackbar();

  void loginUser() {
    if (email == null) {
      snackbar.showSnackbar("Enter email first");
    } else if (password == null) {
      snackbar.showSnackbar("Enter email");
    } else {
      login();
    }
  }

  void login() async {
    LoginModal modal;
    var response = await ApiClint().LogInUser(email, password);
    if (response != null) {
      modal = response;
      if (modal.token !=null) {
        SharedPrefrences().saveToken(modal.token);
        SharedPrefrences().saveId(modal.user.id.toString());
        SharedPrefrences().saveName(modal.user.name);
        SharedPrefrences().saveEmail(modal.user.email);
        SharedPrefrences()
            .saveAvatar((modal.user.avatar != null) ? modal.user.avatar : "");
        SharedPrefrences().savePhone(modal.user.phone);

        Get.offNamed("/NavigationBarScreen");
      }
    }
  }
}
