import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/screens/auth/loginPage.dart';
import 'package:gaddi_part_seller/screens/home/homePage.dart';
import 'package:gaddi_part_seller/screens/spalshScreen.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/Login", page:()=>LoginPage()),
        GetPage(name: "/", page:()=>SplashPage()),
        GetPage(name: "/HomePage", page: ()=>HomePage())
      ],
      home:SplashPage(),
    );
  }
}


class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
