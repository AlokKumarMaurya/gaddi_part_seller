import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../GetXController/auth_controller/Getx_login.dart';
import '../../utils/images.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key? key}) : super(key: key);
   AuthController getxLogin=Get.put(AuthController());
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
                "Login Please",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                onChanged: (val){
                  getxLogin.email=val;
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
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12)),
              child: Obx(()=>TextFormField(
                onChanged: (val){
                  getxLogin.password=val;
                },
                obscureText: !getxLogin.isVisible.value,
                decoration: InputDecoration(
                    icon: Icon(Icons.key),
                    hintText: "Enter password",
                    border: InputBorder.none,
                    suffixIcon: Obx(() =>IconButton(
                        onPressed: () {
                          getxLogin.isVisible.value=!getxLogin.isVisible.value;
                        },
                        icon: Icon(
                          (getxLogin.isVisible.value)?Icons.remove_red_eye:Icons.visibility_off,
                          color: Colors.black,
                        )))),
              )),
            ),

            SizedBox(height: 15,),

      Obx(()=>(getxLogin.isSessionStarted.value)?CircularProgressIndicator():ElevatedButton(

                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade400
                ),
                onPressed: (){
                  getxLogin.loginUser();
                },
                child:Text(" Submit ") )),

            SizedBox(height: 15,),
            Row(
              children: [
                SizedBox(width: 20,),
                Obx(() => Checkbox(value: getxLogin.isRemberOn.value, onChanged:(val){
                  getxLogin.isRemberOn.value=!getxLogin.isRemberOn.value;
                })),
                SizedBox(width: 5,),
                Text("Remember me"),
                Expanded(child: Container(
                  margin: EdgeInsets.only(right: 30),          
                  alignment: Alignment.centerRight,
                  child: Text("Forget Password"),
                ))
              ],
            ) ,
            SizedBox(height: 30,),




           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               SizedBox(width:0,),
                   Text("Not a member register now",),
               ElevatedButton(

                   style: ElevatedButton.styleFrom(
                       primary: Colors.purple.shade400
                   ),
                   onPressed: (){
                        Get.toNamed("/SignUp");
                   },
                   child:Text(" SignUp ")),
               SizedBox(width: 10,)
             ],
           )
          ],
        ),
      ),
    );
  }
}
