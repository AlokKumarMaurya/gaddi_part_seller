import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaddi_part_seller/utils/sharedPrefrences/sharedprefrences.dart';
import 'package:get/get.dart';

import '../../GetXController/more_screen/profile_update_controller.dart';
import '../../utils/images.dart';

class UpdateUserProfile extends StatelessWidget {
  UpdateUserProfile({Key? key}) : super(key: key);
  ProfileUpdateController _profileUpdateController = Get.put(ProfileUpdateController());
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
                SizedBox(
                  height: 20,
                ),
                detailsWidget(),
                SizedBox(
                  height: 20,
                ),
                //submitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  photoWidget() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile Info",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400)),
            InkWell(
              onTap: () {
                _profileUpdateController.verify();
              },
              child: Container(
                alignment: Alignment.center,
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Obx (()=>(_profileUpdateController.imageFilePath==null)?CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade400,
              child: ( _profileUpdateController.profileDetailsController.modal.avatarOriginal!= "")
                  ? Image.network("${_profileUpdateController.profileDetailsController.modal.avatarOriginal}",errorBuilder: ((context, error, stackTrace) => Image.asset(ImagesConstant.logo)),)
                  : Image.asset(ImagesConstant.logo),
            ):Container(
             height: 100,width: 100,decoration: BoxDecoration(
             shape: BoxShape.circle
           ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:Image.file(_profileUpdateController.imageFilePath.value,errorBuilder: ((context, error, stackTrace) => Image.asset(ImagesConstant.logo)),fit: BoxFit.fill,)

              ),
            ), ) ,
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Update your profile photo"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        _profileUpdateController.filePiker();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Upload",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Delete current photo",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  detailsWidget() {
    return Column(
      children: [
        ContainerWidget(
          textFieldtext: "Name",
          title: "Name",
          defaultVal: _profileUpdateController.nameController.value,
          isPhone: false,
          on_change: (a) {
            _profileUpdateController.nameController.value=a;
          },
        ),
        // ContainerWidget(
        //   textFieldtext: "Last name",
        //   title: "Last Name",
        //   defaultVal: _profileUpdateController.lastnameController.value,
        //   isPhone: false,
        //   on_change: (a) {
        //     _profileUpdateController.lastnameController.value=a;
        //   },
        // ),
        ContainerWidget(
          textFieldtext: "Email",
          title: "Email",
          defaultVal:_profileUpdateController.emailController.value,
          isPhone: false,
          on_change: (a) {
            _profileUpdateController.emailController.value=a;
          },
        ),
        ContainerWidget(
            textFieldtext: "Phone Number",
            title: "Phone",
            defaultVal: _profileUpdateController.phoneNumberController.value,
            isPhone: true,
            on_change: (a) {
              _profileUpdateController.phoneNumberController.value=a;
            }),
        ContainerWidget(
          textFieldtext: "New Password",
          title: "Password",
          defaultVal:_profileUpdateController.newPasswordController.value,
          isPhone: false,
          on_change: (a) {
            _profileUpdateController.newPasswordController.value=a;
          },
        ),
        ContainerWidget(
          textFieldtext: "Password",
          title: "Confirm Password",
          defaultVal:  _profileUpdateController.confirmPasswordController.value,
          isPhone: false,
          on_change: (a) {
            _profileUpdateController.confirmPasswordController.value=a;
          },
        ),
        ContainerWidget(
          textFieldtext: "Address",
          title: "Address",
          defaultVal: _profileUpdateController.addressController.value,
          isPhone: false,
          on_change: (a) {
            _profileUpdateController.addressController.value=a;
          },
        ),
        ContainerWidget(
          textFieldtext: "Country",
          title: "Country",
          defaultVal:  _profileUpdateController.countryController.value,
          isPhone: false,
          on_change: (a) {
            _profileUpdateController.countryController.value=a;
          },
        ),
        ContainerWidget(
          textFieldtext: "City",
          title: "City",
          defaultVal: _profileUpdateController.cityController.value,
          isPhone: false,
          on_change: (a) {
            _profileUpdateController.cityController.value=a;
          },
        ),
        ContainerWidget(
          textFieldtext: "code",
          title: "Postal code",
          defaultVal: _profileUpdateController.postalCodeController.value,
          isPhone: true,
          on_change: (a) {
            _profileUpdateController.postalCodeController.value=a;
          },
        ),
        // ContainerWidget(
        //   textFieldtext: "name",
        //   title: "Bank Name",
        //   defaultVal: _profileUpdateController.bankNameController.value,
        //   isPhone: false,
        //   on_change: (a) {
        //     _profileUpdateController.bankNameController.value=a;
        //   },
        // ),
        // ContainerWidget(
        //   textFieldtext: "Account no.",
        //   title: "Bank Account no.",
        //   defaultVal: _profileUpdateController.bankAccount_No_Controller.value,
        //   isPhone: true,
        //   on_change: (a) {
        //     _profileUpdateController.bankAccount_No_Controller.value=a;
        //   },
        // ),
      ],
    );
  }

  submitButton() {
    return ElevatedButton(
      onPressed: () {
        // print(name.value);
        // print(lastName.value);
        // print(email.value);
        // print(phone.value);
        // print(password.value);
      },
      child: Text("Update"),
      style: ElevatedButton.styleFrom(primary: Colors.purple.shade400),
    );
  }


}

class ContainerWidget extends StatelessWidget {
  String title;
  String textFieldtext;
  String defaultVal;
  bool isPhone;
  Function on_change;

  ContainerWidget(
      {Key? key,
      required this.textFieldtext,
      required this.title,
      required this.defaultVal,
      required this.isPhone,
      required this.on_change(String a)})
      : super(key: key);

// TextEditingController _controller=TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.transparent)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${this.title}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 0,
              ),
              TextFormField(
                onChanged: (val) => on_change(val),
                // controller: _controller,
                inputFormatters: [
                  (this.isPhone)
                      ? LengthLimitingTextInputFormatter(10)
                      : LengthLimitingTextInputFormatter(30)
                ],
                keyboardType:
                    (this.isPhone) ? TextInputType.phone : TextInputType.text,
                initialValue: "${this.defaultVal}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "${this.textFieldtext}",
                ),
              )
            ],
          ),
        ));
  }
}
