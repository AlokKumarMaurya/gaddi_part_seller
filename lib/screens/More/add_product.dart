import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../helperWidget/custom_textFiled.dart';


class AddProduct extends StatelessWidget {
   AddProduct({Key? key}) : super(key: key);
   var high=100.0.obs;
   var widt=200.0.obs;
  @override

  Widget build(BuildContext context) {
    high.value=MediaQuery.of(context).size.height;
    widt.value=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Products"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // photoWidget(),
                // SizedBox(
                //   height: 20,
                // ),
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

  detailsWidget() {
 var filedHeight=high.value/13.5;
 var test="1".obs;
    return Column(
      children: [
        ContainerWidget(
          textFieldtext: "Name",
          title: "Name",
          defaultVal: "",
          isPhone: false,
          on_change: (a) {
            // _profileUpdateController.nameController.value=a;
          },
        ),
        ContainerWidget(
          textFieldtext: "Email",
          title: "Email",
          defaultVal:"",
          isPhone: false,
          on_change: (a) {
            // _profileUpdateController.emailController.value=a;
          },
        ),                                                                                                                                        
        ContainerWidget(
            textFieldtext: "Phone Number",
            title: "Phone",
            defaultVal: "",
            isPhone: true,
            on_change: (a) {
              // _profileUpdateController.phoneNumberController.value=a;
            }),
        ContainerWidget(
          textFieldtext: "New Password",
          title: "Password",
          defaultVal:"jk",
          isPhone: false,
          on_change: (a) {
            // _profileUpdateController.newPasswordController.value=a;
          },
        ),
        RowWidget(dropdownHeading: "dropdownHeading", textFieldHeading: "textFieldHeading", defauldText: "defauldText", dropDownList: [1,2,3,4,5], on_drop_down_change: (a){
            print(a);
          }, on_text_field_change:(a){
            print(a);
          }, dropDownInitialValue: "1".obs),
        ContainerWidget(
          textFieldtext: "Address",
          title: "Address",
          defaultVal: "lk",
          isPhone: false,
          on_change: (a) {
            // _profileUpdateController.addressController.value=a;
          },
        ),
        ContainerWidget(
          textFieldtext: "Country",
          title: "Country",
          defaultVal:  "kjl",
          isPhone: false,
          on_change: (a) {
            // _profileUpdateController.countryController.value=a;
          },
        ),
        ContainerWidget(
          textFieldtext: "City",
          title: "City",
          defaultVal: "l;",
          isPhone: false,
          on_change: (a) {
            // _profileUpdateController.cityController.value=a;
          },
        ),
        ContainerWidget(
          textFieldtext: "code",
          title: "Postal code",
          defaultVal:"l;",
          isPhone: true,
          on_change: (a) {
            // _profileUpdateController.postalCodeController.value=a;
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
}





