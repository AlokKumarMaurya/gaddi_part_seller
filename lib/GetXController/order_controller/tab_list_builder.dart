import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/all_order_list/allOrderListModal.dart';
import '../../utils/images.dart';
import 'get_all_orders.dart';

class TabListBuilder extends StatelessWidget {
  List<Order> dataList;
   TabListBuilder({Key? key ,required this.dataList}) : super(key: key);
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
                            (dataList[index].paymentStatus!="PaymentStatus.UNPAID")?Row(
                              children: [
                                Container(
                                  height: 20,width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text("Pending")
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
                    Container(
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
                        child: Text("${dataList[index].deliveryStatus}",style: TextStyle(
                          fontSize: 18,color: Colors.white
                        ),),
                      ),
                    )
                  ],
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
}
