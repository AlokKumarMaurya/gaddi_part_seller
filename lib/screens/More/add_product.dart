import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../GetXController/more_screen/add_product_controller.dart';
import '../../helperWidget/custom_textFiled.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key}) : super(key: key);
  var high = 100.0.obs;
  var widt = 200.0.obs;
  @override
  AddProductController _addProductController = Get.put(AddProductController());

  Widget build(BuildContext context) {
    high.value = MediaQuery.of(context).size.height;
    widt.value = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ContainerWidget(
          textFieldtext: "Name",
          title: "Name",
          defaultVal: "",
          isPhone: false,
          on_change: (a) {
            debugPrint(a);
            _addProductController.name.value = a;
          },
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownContainer(
                dropdownHeading: "Category ID",
                dropDownList: ["Category ID", "1", "2", "34", "4"],
                on_drop_down_change: (a) {
                  _addProductController.categoryId.value=a;
                },
                dropDownInitialValue: "${_addProductController.categoryId.value}".obs),
            DropDownContainer(
                dropdownHeading: "Brand ID",
                dropDownList: ["Select Brand", "2", "34", "4"],
                on_drop_down_change: (a) {_addProductController.barndId.value=a;},
                dropDownInitialValue: "${_addProductController.barndId.value}".obs),

          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownContainer(
                dropdownHeading: "Is Refundable",
                dropDownList: ["","Yes", "No"],
                on_drop_down_change: (a) {_addProductController.isRefundable.value=a;},
                dropDownInitialValue: "${_addProductController.isRefundable.value}".obs),
            DropDownContainer(
                dropdownHeading: "Is Genuine",
                dropDownList: ["","Yes", "No"],
                on_drop_down_change: (a) {_addProductController.isGeniune.value=a;},
                dropDownInitialValue: "${_addProductController.isGeniune.value}".obs),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ContainerWidget(
          textFieldtext: "Min. Qty. for purchase",
          title: "Min. Qty",
          defaultVal: "",
          isPhone: true,
          on_change: (a) {
            _addProductController.minQty.value=a;
          },
        ),
        SizedBox(
          height: 15,
        ),
        ContainerWidget(
            textFieldtext: "low stock qty.",
            title: "Set Alert",
            defaultVal: "",
            isPhone: true,
            on_change: (a) {
              _addProductController.setAlert.value=a;
            }),

        SizedBox(
          height: 15,
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          child: Text(
            "Select Date Range of Discount",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          child: Text(
            "Select start Date",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        datePickerWidget("Start"),
        SizedBox(height: 15,),
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          child: Text(
            "Select end Date ",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(height: 10,),
        datePickerWidget("End"),

        SizedBox(
          height: 15,
        ),
        RowWidget(
            dropdownHeading: "Stock visible",
            textFieldHeading: "Quality",
            defauldText: "",
            dropDownList: ["","Yes", "No"],
            on_drop_down_change: (a) {
              _addProductController.stockVisible.value=a;
            },
            on_text_field_change: (a) {
              _addProductController.quality.value=a;
            },
            dropDownInitialValue: "${_addProductController.stockVisible.value}".obs),
        SizedBox(
          height: 15,
        ),
        ContainerWidget(
          textFieldtext: "unit price",
          title: "Unit price",
          defaultVal: "",
          isPhone: true,
          on_change: (a) {
            _addProductController.unitPrice.value=a;
          },
        ),
        SizedBox(
          height: 15,
        ),
        RowWidget(
            dropdownHeading: "Discount type",
            textFieldHeading: "Discount",
            defauldText: "Discount value",
            dropDownList: ["","Percentage", "Rupees"],
            on_drop_down_change: (a) {
              _addProductController.discountType.value=a;
            },
            on_text_field_change: (a) {
              _addProductController.discount.value=a;
            },
            dropDownInitialValue: "${_addProductController.discount.value}".obs),

        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownContainer(
                dropdownHeading: "Earn point",
                dropDownList: ["","Yes", "No"],
                on_drop_down_change: (a) {_addProductController.earnPont.value=a;},
                dropDownInitialValue: "${_addProductController.earnPont.value}".obs),
            DropDownContainer(
                dropdownHeading: "Shipping type",
                dropDownList: ["","COD", "Online"],
                on_drop_down_change: (a) {_addProductController.shippingType.value=a;},
                dropDownInitialValue: "${_addProductController.shippingType.value}".obs),
          ],
        ),
        SizedBox(
          height: 15,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImagePickerWidget(fileType: "Image"),
            ImagePickerWidget(fileType: "Thumbnail"),
          ],
        ),

        SizedBox(
          height: 15,
        ),
        // ImagePickerWidget(fileType: "")
        ContainerWidget(
          textFieldtext: "Estimated shipping days",
          title: "Estimated shipping days",
          defaultVal: "",
          isPhone: true,
          on_change: (a) {
            _addProductController.estimatedShippingDays.value=a;
          },
        ),
        SizedBox(
          height: 15,
        ),
        ContainerWidget(
          textFieldtext: "Flat shipping cost",
          title: "Amount",
          defaultVal: "",
          isPhone: true,
          on_change: (a) {
            _addProductController.amount.value=a;
          },
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: widt / 2.5,
              child: ContainerWidget(
                textFieldtext: "Qty",
                title: "Current Stock",
                defaultVal: "",
                isPhone: true,
                on_change: (a) {
                  _addProductController.curentStock.value=a;
                },
              ),
            ),
          ],
        ),

        SizedBox(
          height: 15,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: widt / 2.5,
              child: ContainerWidget(
                textFieldtext: "Tags",
                title: "Tags",
                defaultVal: "",
                isPhone: false,
                on_change: (a) {
                  _addProductController.tags.value=a;
                },
              ),
            ),
            Container(
              width: widt / 2.5,
              child: ContainerWidget(
                textFieldtext: "Sku",
                title: "Sku",
                defaultVal: "",
                isPhone: false,
                on_change: (a) {
                  _addProductController.sku.value=a;
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ContainerWidget(
          textFieldtext: "Hsh",
          title: "Hsh",
          defaultVal: "",
          isPhone: false,
          on_change: (a) {
            _addProductController.hsh.value=a;
          },
        ),
        SizedBox(
          height: 15,
        ),
        ContainerWidget(
          textFieldtext: "Description",
          title: "Description",
          defaultVal: "",
          isPhone: false,
          on_change: (a) {
            _addProductController.description.value=a;
          },
        ),
        SizedBox(
          height: 25,
        ),
        ElevatedButton(onPressed: ()=>_addProductController.uploadProduct(), child: Text("Add Product"))
      ],
    );
  }

  datePickerWidget(String startOrEnd) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 3,
            blurRadius: 11,
            offset: const Offset(0, 1),
          ),
        ], color: Colors.white),
        child: Obx(() => (startOrEnd=="Start")?TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                  fillColor: Colors.white54,
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  hintText:
                      "${_addProductController.startselectedDate.value.year.toString()}-${_addProductController.startselectedDate.value.month.toString()}-${_addProductController.startselectedDate.value.day.toString()}",
                  hintStyle: TextStyle(
                      color: Color(0xff1D2B84),
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  prefixIcon: const Icon(Icons.date_range_outlined,
                      color: Color(0xff1D2B84)),
                  suffixIcon: InkWell(
                    onTap: () => _addProductController.pickDate(startOrEnd),
                    child: Container(
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xff1D2B84),
                        boxShadow: [],
                      ),
                      child: Center(
                          child: Text(
                        "Pick $startOrEnd Date",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                    ),
                  )),
            ) :TextFormField(
          readOnly: true,
          decoration: InputDecoration(
              fillColor: Colors.white54,
              filled: true,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              hintText:
              "${_addProductController.endselectedDate.value.year.toString()}-${_addProductController.endselectedDate.value.month.toString()}-${_addProductController.endselectedDate.value.day.toString()}",
              hintStyle: TextStyle(
                  color: Color(0xff1D2B84),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              prefixIcon: const Icon(Icons.date_range_outlined,
                  color: Color(0xff1D2B84)),
              suffixIcon: InkWell(
                onTap: () => _addProductController.pickDate(startOrEnd),
                child: Container(
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xff1D2B84),
                    boxShadow: [],
                  ),
                  child: Center(
                      child: Text(
                        "Pick $startOrEnd Date",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                ),
              )),
        )
        ),
      ),
    );
  }

  imagePickerWidget() {
    return Container(child: Text("test"));
  }
}

class ImagePickerWidget extends StatelessWidget {
  ImagePickerWidget({Key? key, required this.fileType}) : super(key: key);
  final String fileType;
  AddProductController _addProductController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return (fileType == "Image")
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width / 2.4,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 3,
                    blurRadius: 11,
                    offset: const Offset(0, 1),
                  ),
                ], color: Colors.white),
                child: (_addProductController.imagePathString == null)
                    ? InkWell(
                        onTap: () =>
                            _addProductController.filePiker(this.fileType),
                        child: Container(
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Color(0xff1D2B84),
                            boxShadow: [],
                          ),
                          child: Center(
                              child: Text(
                            "Pick \n${this.fileType}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                        ),
                      )
                    : Column(
                        children: [
                          Image.file(
                            _addProductController.imageFilePath!,
                            fit: BoxFit.fill,
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                          ),
                          TextButton(
                              onPressed: () =>
                                  _addProductController.filePiker("Image"),
                              child: Text("Pick another file"))
                        ],
                      )),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width / 2.4,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 3,
                    blurRadius: 11,
                    offset: const Offset(0, 1),
                  ),
                ], color: Colors.white),
                child: (_addProductController.thumbnailPathString == null)
                    ? InkWell(
                        onTap: () =>
                            _addProductController.filePiker(this.fileType),
                        child: Container(
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Color(0xff1D2B84),
                            boxShadow: [],
                          ),
                          child: Center(
                              child: Text(
                            "Pick \n${this.fileType}",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                        ),
                      )
                    : Column(
                        children: [
                          Image.file(
                            _addProductController.thumbnailFilePath!,
                            fit: BoxFit.fill,
                            height: 200,
                            width: MediaQuery.of(context).size.width / 2.4,
                          ),
                          TextButton(
                              onPressed: () => _addProductController
                                  .filePiker(this.fileType),
                              child: Text("Pick another file"))
                        ],
                      )),
          );
  }
}
