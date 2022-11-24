import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoggedIn=false;
  void getLogin(){
    var sh=GetStorage();
    var token=sh.read("LoginToken");
    if(token!=null)
      {
        setState(() {
          isLoggedIn=true;
        });
      }
  }


  @override
  void initState() {
    getLogin();
    Timer(Duration(seconds: 2), () {
      (isLoggedIn)?Get.offNamed("/HomePage"):Get.offNamed("/Login");
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(ImagesConstant.SplashImage,),

      ),
    );
  }
}
