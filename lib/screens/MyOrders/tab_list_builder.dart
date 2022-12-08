import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/all_order_list/allOrderListModal.dart';
import '../../utils/images.dart';
import '../../GetXController/order_controller/get_all_orders.dart';

class TabListBuilder extends StatelessWidget {
  List<Order> dataList;
  bool isAll;
   TabListBuilder({Key? key ,required this.dataList,required this.isAll}) : super(key: key);
  RxBool isLoading=false.obs;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        isLoading.value=true;
        Future.delayed(Duration(seconds: 3)).then((value){
          isLoading.value=false;
        });
      },
      child: Obx(()=>(!isLoading.value)?(dataList.length!=0)?ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: ()=>openOrderDetailSheet(dataList[index]),
              child: Card(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 13),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order id : ${dataList[index].id}",style: TextStyle(
                                fontSize: 18,
                              ),),
                              SizedBox(height: 5,),
                              Text("Price : ₹${dataList[index].grandTotal}")
                            ],
                          ),
                          Column(
                            children: [
                              Text("Payment Status"),
                              SizedBox(height: 5,),
                              (dataList[index].paymentStatus=="unpaid")?Row(
                                children: [
                                  Container(
                                    height: 20,width: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text("Unpaid")
                                ],
                              ):Row(
                                children: [
                                  Container(
                                    height: 20,width: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Text("Paid")
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      (isAll)?Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          height: 40,
                          width: MediaQuery.of(context).size.width/2,
                          child: Text("${dataList[index].deliveryStatus!.toUpperCase()}",style: TextStyle(
                            
                            fontSize: 18,color: Colors.white
                          ),),
                        ),
                      ):Container()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ):
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(ImagesConstant.noData),
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Text("No Data found")
          ],
        ),
      )

          :Center(child: CircularProgressIndicator(),),
    ));
  }







  void openOrderDetailSheet(Order data) async {
    // if(Get.isBottomSheetOpen){
    //   Get.back();
    // }
    Get.bottomSheet(Obx(() => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        height: 400,
        child: (isLoading.value)
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  widthFactor: double.infinity,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Text(
                    "Order Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  ),
                ),
                (data.paymentType== "cash_on_delivery")
                    ? Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(ImagesConstant.cashImage),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Text(
                              "Payment type",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            Text(
                              "Cash On Delivery",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Payment Status",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: ("${data.paymentStatus}" ==
                                      "unpaid")
                                      ? Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.red),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Unpaid",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color:
                                                  Colors.black45))
                                        ],
                                      ))
                                      : Container(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Paid",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  color:
                                                  Colors.black45))
                                        ],
                                      )),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                )
                    : Card(
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(ImagesConstant.creditCard),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            "Payment type",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                          Text(
                            "Online Payment",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "${data.shippingAddress}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black45)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Shipped To : getOrderDetailsmodal.shippingAddress.name}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      Text(
                          "Email : getOrderDetailsmodal.shippingAddress.email}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Product Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                // width: MediaQuery.of(context).size.width/2.4,
                                child: Text("{getOrderDetailsmodal.orderDetails.productName}")),
                          ],
                        ),
                        Text("Unit Price: ₹getOrderDetailsmodal.orderDetails.unitPrice}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),)
                      ],
                    ))
              ],
            )),
      ),
    )));

  }
}
