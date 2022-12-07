import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaddi_part_seller/utils/sharedPrefrences/sharedprefrences.dart';
import 'package:get/get.dart';

import '../../utils/images.dart';

class UpdateUserProfile extends StatelessWidget {
  UpdateUserProfile({Key? key}) : super(key: key);

  var name="".obs;
  var lastName=''.obs;
  var email=''.obs;
  var phone="".obs;
  var password="".obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                photoWidget(),
                 SizedBox(height: 20,),
                detailsWidget() ,
                SizedBox(height: 20,),
                 submitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  photoWidget(){
    return Column(
      children: [
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Profile Info",style:TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w400
            )),
            InkWell(
              onTap: (){
                Get.back();
              },
              child: Container(
                alignment: Alignment.center,
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Save",style:TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),),
              ),
            )
          ],
        ) ,
        SizedBox(height: 15,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade400,
              child: (SharedPrefrences().getAvatar()!="")?Image.network("${SharedPrefrences().getAvatar()}"):Image.asset(ImagesConstant.logo),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Update your profile photo"),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Upload",style:TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Text("Delete current photo",style: TextStyle(
                        color: Colors.red,
                        fontSize: 15
                    ),)
                  ],
                ) ,
              ],
            )
          ],
        ) ,
        SizedBox(height: 30,),

      ],
    );
  }
  detailsWidget(){
    return Column(
          children: [
            ContainerWidget(textFieldtext: "Name", title:"Name",defaultVal:SharedPrefrences().getName(),isPhone: false,on_change: (a){name.value=a;},) ,
            ContainerWidget(textFieldtext: "Last name", title:"Last Name",defaultVal:SharedPrefrences().getName(),isPhone:false,on_change: (a){lastName.value=a;},) ,
            ContainerWidget(textFieldtext: "Email", title:"Email",defaultVal:SharedPrefrences().getEmail(),isPhone: false,on_change: (a){email.value=a;},) ,
            ContainerWidget(textFieldtext: "Phone Number", title:"Phone",defaultVal:SharedPrefrences().getPhone(),isPhone:true,on_change: (a){phone.value=a;}) ,
            ContainerWidget(textFieldtext: "New Password", title:"Password",defaultVal:SharedPrefrences().getPhone(),isPhone:false,on_change: (a){password.value=a;},) ,
          ],
    );
  }
  submitButton() {
    return ElevatedButton(onPressed: (){
print(name.value);
print(lastName.value);
print(email.value);
print(phone.value);
print(password.value);
    }, child:Text("Update"),style: ElevatedButton.styleFrom(
    primary: Colors.purple.shade400
    ),);
  }
}



class ContainerWidget extends StatelessWidget {
  String title;
  String textFieldtext;
  String defaultVal;
  bool isPhone;
  Function on_change;
   ContainerWidget({Key? key,required this.textFieldtext,required this.title,required this.defaultVal,required this.isPhone,required this.on_change(String a)}) : super(key: key);
// TextEditingController _controller=TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child:Container(
      height:75,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${this.title}",style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 0,) ,
          TextFormField(
            onChanged: (val)=>on_change(val),
            // controller: _controller,
            inputFormatters: [
              (this.isPhone)?LengthLimitingTextInputFormatter(10):LengthLimitingTextInputFormatter(30)
            ],
            keyboardType: (this.isPhone)?TextInputType.phone:TextInputType.text,
            initialValue:"${this.defaultVal}",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "${this.textFieldtext}"  ,
            ),
          )
        ],
      ),
    ));
  }
}
