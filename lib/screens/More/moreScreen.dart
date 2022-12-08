import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/screens/More/add_product.dart';
import 'package:gaddi_part_seller/screens/More/update_profile.dart';
import 'package:gaddi_part_seller/utils/images.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../GetXController/Check_is_login.dart';
import '../../GetXController/GetHtmlContent/HtmlContent.dart';
import '../../GetXController/more_screen/profile_update_controller.dart';
import '../../helperWidget/app_bar.dart';
import '../../utils/sharedPrefrences/sharedprefrences.dart';
import '../auth/loginPage.dart';
import 'htmlView.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({Key? key}) : super(key: key);
  CheckIfLogin checkIfLogin = Get.put(CheckIfLogin());
  HtmlContentData htmlContentData = Get.put(HtmlContentData());
  double iconSize = 25;
  TextStyle _textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w300);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar().CustomAppBar,
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              (!checkIfLogin.isLoggedIn.value)
                  ? Container(
                      height: 170,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                ImagesConstant.logo,
                              ),
                              fit: BoxFit.fitHeight)),
                    )
                  : Container(
                      height: 170,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300, shape: BoxShape.circle),
                      child: Center(
                        // _profileUpdateController.profileDetailsController.modal.avatarOriginal
                        child: Image.network("https://softfix.in/demo/gaadipart/public/${SharedPrefrences().getAvatar()}",
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              child: Image.asset(ImagesConstant.logo),
                            );
                          },),
                      ),
                    ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                       onTap:(){
                         updateProfile();
                       } ,
                      leading: Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: iconSize,
                      ),
                      title: Text(
                        "Profile",
                        style: _textStyle,
                      ),
                    ),
                    ListTile(
                      onTap: (){
                        Get.to(AddProduct(),fullscreenDialog: true);
                      },
                      leading: Icon(
                        Icons.production_quantity_limits,
                        color: Colors.blue,
                        size: iconSize,
                      ),
                      title: Text(
                        "Add Product",
                        style: _textStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.wallet,
                        color: Colors.blue,
                        size: iconSize,
                      ),
                      title: Text(
                        "Wallet",
                        style: _textStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.food_bank_outlined,
                        color: Colors.blue,
                        size: iconSize,
                      ),
                      title: Text(
                        "Bank",
                        style: _textStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.shop_2_outlined,
                        color: Colors.blue,
                        size: iconSize,
                      ),
                      title: Text(
                        "My Shop",
                        style: _textStyle,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            title: "Setting",
                            middleText: "Change theme",
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                    Get.changeTheme(ThemeData.dark());
                                    SharedPrefrences().saveTheme(true);
                                  },
                                  child: Text("Dark Theme")),
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                    SharedPrefrences().saveTheme(false);
                                    Get.changeTheme(ThemeData.light());
                                  },
                                  child: Text("Light Theme"))
                            ]);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.blue,
                          size: iconSize,
                        ),
                        title: Text(
                          "Setting",
                          style: _textStyle,
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(HtmlContentViewer(), arguments: {
                          "html": htmlContentData.seller_return_policies,
                          "title":"Seller Return Policy"
                        });
                      },
                      leading: Icon(
                        Icons.account_box_outlined,
                        color: Colors.blue,
                        size: iconSize,
                      ),
                      title: Text(
                        "Return Policy",
                        style: _textStyle,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(HtmlContentViewer(), arguments: {
                          "html": htmlContentData.seller_support,
                          "title":"Seller Support Policy"
                        });
                      },
                      leading: Icon(
                        Icons.menu_book,
                        color: Colors.blue,
                        size: iconSize,
                      ),
                      title: Text(
                        "Support",
                        style: _textStyle,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        debugPrint("222222222222222222222222222222");
                        Get.to(HtmlContentViewer(), arguments: {
                          "html": htmlContentData.privacy_policy,
                          "title":"Privacy Policy"
                        });
                      },
                      leading: Icon(
                        Icons.privacy_tip_outlined,
                        color: Colors.blue,
                        size: iconSize,
                      ),
                      title: Text(
                        "Privacy Policy",
                        style: _textStyle,
                      ),
                    ),
                    (!checkIfLogin.isLoggedIn.value)
                        ? ListTile(
                            leading: Icon(
                              Icons.login,
                              color: Colors.blue,
                              size: iconSize,
                            ),
                            title: Text(
                              "Log in",
                              style: _textStyle,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              Get.off(LoginPage());
                              SharedPrefrences().saveToken("");
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.logout,
                                color: Colors.blue,
                                size: iconSize,
                              ),
                              title: Text(
                                "Log Out",
                                style: _textStyle,
                              ),
                            ),
                          ),
                    InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            title: "App Info",
                            middleText: "App version : 1.0.0",
                            textCancel: "Close",
                            onCancel: Get.back,
                            barrierDismissible: false);
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.app_blocking,
                          color: Colors.blue,
                          size: iconSize,
                        ),
                        title: Text(
                          "AppInfo",
                          style: _textStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateProfile() {
Get.to(UpdateUserProfile(),fullscreenDialog: true);
  }
}
