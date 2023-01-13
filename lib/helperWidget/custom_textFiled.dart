import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../GetXController/more_screen/add_product_controller.dart';

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
  AddProductController _addProductController=Get.put(AddProductController());
  @override
  Widget build(BuildContext context) {
    _addProductController.onInit() ;
    return Form(
        // key: formKey,
        child: Container(
          height: 80,
          width: double.infinity,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(12),
          //     border: Border.all(color: Colors.black)),
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
                height:5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  // controller: _addProductController.textEditingController,
                    onChanged: (val) => on_change(val),
                    // controller: _controller,
                    inputFormatters: [
                      (this.isPhone)
                          ? LengthLimitingTextInputFormatter(10)
                          : LengthLimitingTextInputFormatter(30)
                    ],
                    keyboardType:
                    (this.isPhone) ? TextInputType.phone : TextInputType.text,
                    initialValue: this.defaultVal??" ",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                    decoration: InputDecoration(
                      hintText: "${this.textFieldtext}",
                      border: InputBorder.none,
                      // labelText: "${this.title}",
                      // labelStyle:TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.w500),
                    )
                ),
              )
            ],
          ),
        ));
  }
}





class RowWidget extends StatelessWidget {
  String dropdownHeading;
  String textFieldHeading;
  String defauldText;
  Function on_text_field_change;
  List dropDownList;
  Function on_drop_down_change;
  RxString dropDownInitialValue;

  RowWidget({Key? key,required this.dropdownHeading,required this.textFieldHeading,required this.defauldText,required this.dropDownList,required this.on_drop_down_change,required this.on_text_field_change,required this.dropDownInitialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxDouble filedHeight=100.0.obs;
    RxDouble widt=10.0.obs;
    filedHeight.value=MediaQuery.of(context).size.width/8;
    widt.value=MediaQuery.of(context).size.width ;
    return   Container(
      alignment: Alignment.center,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${dropdownHeading}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height:5,
              ),
              Obx(() =>  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black)
                  ),
                  width: widt/5,
                  height: filedHeight.value,
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          isExpanded: true,
                          value: dropDownInitialValue.value,

                          // style: TextStyle(
                          //   overflow: TextOverflow.ellipsis,
                          //   color: Colors.black,
                          //   fontSize: 15
                          // ),
                          hint: Text("Select value.",style: TextStyle(
                              color: Colors.black
                          ),),
                          items: dropDownList.map((e){
                            return DropdownMenuItem(
                                value: e.toString(),
                                child: Text(e.toString())) ;
                          }).toList(), onChanged:(val){
                        on_drop_down_change(val.toString());
                        dropDownInitialValue.value=val.toString();  })))),
            ],
          ),
          Container(
            width: widt/2,
            child: ContainerWidget(
              textFieldtext: "",
              title: "${textFieldHeading}",
              defaultVal:  "${defauldText}",
              isPhone: false,
              on_change: (a)=>on_text_field_change(a.toString()),
            ),
          ),
        ],
      ),
    )    ;
  }
}

class DropDownContainer extends StatelessWidget {
  const DropDownContainer({Key? key ,required this.dropdownHeading,required this.dropDownList,required this.on_drop_down_change,required this.dropDownInitialValue}) : super(key: key);
   final String dropdownHeading;
   final RxString dropDownInitialValue;
   final List dropDownList;
   final Function on_drop_down_change;
  @override
  Widget build(BuildContext context) {
    RxDouble filedHeight=100.0.obs;
    RxDouble widt=10.0.obs;
    filedHeight.value=MediaQuery.of(context).size.width/9;
    widt.value=MediaQuery.of(context).size.width ;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${dropdownHeading}",
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height:5,
        ),
        Obx(() =>  Container(
          padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            width: widt/3,
            height: filedHeight.value,
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    isExpanded: true,
                    value: dropDownInitialValue!.value,
                    disabledHint: Text("hint text"),
                    // style: TextStyle(
                    //   overflow: TextOverflow.ellipsis,
                    //   color: Colors.black,
                    //   fontSize: 15
                    // ),
                    hint: Text("Select value",style: TextStyle(
                        color: Colors.black
                    ),),
                    items: dropDownList.map((e){
                      return DropdownMenuItem(
                          value: e.toString(),
                          child: Text(e.toString())) ;
                    }).toList(), onChanged:(val){
                  on_drop_down_change(val.toString());
                  if(dropDownInitialValue!=null)
                    {dropDownInitialValue!.value=val.toString();
                    debugPrint(dropDownInitialValue!.value.toString());}

                    })))),
      ],
    );
  }
}
