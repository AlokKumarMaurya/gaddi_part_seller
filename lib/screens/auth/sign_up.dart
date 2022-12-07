import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../GetXController/auth_controller/Getx_login.dart';
import '../../utils/images.dart';
class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
  AuthController _authController=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(ImagesConstant.splashImage),
              height: 150,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "SignUp here",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                onChanged: (val){
                  _authController.Sname=val;
                },
                decoration: InputDecoration(
                  // labelText: "Name",
                    icon: Icon(Icons.person),
                    hintText: "Enter your name",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height:20,),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                onChanged: (val){
                _authController.Semail=val;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Enter your email",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                onChanged: (val){
               _authController.Sphone=val;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.phone_android),
                    // labelText: "Phone",
                    hintText: "Enter your phone number",
                    border: InputBorder.none),
              ),
            ),
                SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: Obx(()=>TextFormField(
                onChanged: (val){
                 _authController.Spassword=val;
                },
              obscureText: !_authController.isVisible.value,
                decoration: InputDecoration(
                    icon: Icon(Icons.key),
                    hintText: "Enter password",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                        onPressed: () {
                          _authController.isVisible.value=!_authController.isVisible.value;
                        },
                        icon: Icon(
                          (_authController.isVisible.value)?Icons.remove_red_eye:Icons.visibility_off,
                          color: Colors.black,
                        ))),
              )),
            ),

            SizedBox(height: 15,),

            Obx(()=>(_authController.isSessionStarted.value)?CircularProgressIndicator():ElevatedButton(

                style: ElevatedButton.styleFrom(
                    primary: Colors.purple.shade400
                ),
                onPressed: (){
                 _authController.SignUpUser();
                },
                child:Text(" SignUp "))),

            SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(width: 20,),
               Obx(() =>Checkbox(value: _authController.isRemberOn.value, onChanged:(val){
                   _authController.isRemberOn.value=!_authController.isRemberOn.value;
                })),
                SizedBox(width: 5,),
                Text("Rember me"),
                Expanded(child: Container(
                ))
              ],
            )
          ],
        ),
      ),
    ) ;
  }
}
