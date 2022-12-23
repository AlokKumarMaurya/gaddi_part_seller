import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/screens/More/htmlView.dart';
import 'package:gaddi_part_seller/screens/More/update_profile.dart';
import 'package:gaddi_part_seller/screens/auth/loginPage.dart';
import 'package:gaddi_part_seller/screens/auth/sign_up.dart';
import 'package:gaddi_part_seller/screens/bottomNavigationBar/bottom_navigation_bar.dart';
import 'package:gaddi_part_seller/screens/home/homePage.dart';
import 'package:gaddi_part_seller/screens/spalshScreen.dart';
import 'package:gaddi_part_seller/utils/sharedPrefrences/sharedprefrences.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(SharedPrefrences().getTheme().toString());
    return GetMaterialApp(
      //themeMode: (!SharedPrefrences().get_theme())?ThemeMode.dark:ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/Login", page:()=>LoginPage()),
        GetPage(name: "/", page:()=>SplashPage()),
        GetPage(name: "/HomePage", page: ()=>HomePage()),
        GetPage(name: "/NavigationBarScreen", page:()=>NavigationBarScreen(initialIndex: 0,)),
         GetPage(name: "/HtmlContentViewer", page:()=>HtmlContentViewer()) ,
        GetPage(name: "/SignUp", page:()=>SignUpScreen()),
        GetPage(name: "/UpdateUserProfile", page: ()=>UpdateUserProfile())
      ],
      home:SplashPage(),
    );
  }
}

