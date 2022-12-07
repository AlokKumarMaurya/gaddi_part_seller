import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../GetXController/order_controller/get_all_orders.dart';
import '../../GetXController/order_controller/tab_list_builder.dart';
import '../../utils/images.dart';
import '../bottomNavigationBar/BottomBartab_controller.dart';

class MyOrders extends StatelessWidget {
  int controllValue;
  MyOrders({Key? key, required this.controllValue}) : super(key: key);
  BottomBarItemClick barItemClick=Get.put(BottomBarItemClick());
  var isloading = false.obs;
  GetAllOrder _getAllOrder=Get.put(GetAllOrder());

  @override
  Widget build(BuildContext context) {
List tabList=["All","Pending","Processing","Delivered","Returned","Failed","Cancelled","Confirmed","Out for delivery"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image(
            image: AssetImage(ImagesConstant.logo),
          ),
        ),
      ),
      body: Obx(
        () =>  DefaultTabController(
                length: 9,
                initialIndex: barItemClick.tabControl.value,
                child: Column(
                  children: [
                    TabBar(
                      physics: ScrollPhysics(),
                      isScrollable: true,
                      tabs: [
                        // ListView.builder(
                        //   shrinkWrap: true,
                        //     scrollDirection: Axis.horizontal,
                        //     itemCount: tabList.length,
                        //     itemBuilder: (context,index){return Tab(
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 25, vertical: 10),
                        //     decoration: BoxDecoration(
                        //         color: Colors.grey.shade300,
                        //         borderRadius: BorderRadius.circular(30)),
                        //     child: Text(
                        //       "${tabList[index]}",
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ),
                        // );}),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "All",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Pending",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Processing",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Delivered",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Returned",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Failed",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Cancelled",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Confirmed",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Out for delivery",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          print("=====================");
                          isloading.value = true;
                          Future.delayed(Duration(seconds: 3)).then((value) {
                            isloading.value = false;
                          });
                        },
                        child:(!isloading.value)
                            ? TabBarView(
                          physics: AlwaysScrollableScrollPhysics(),
                          children: [
                            // Center(
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Image(
                            //         image: AssetImage(ImagesConstant.noData),
                            //         height: 250,
                            //       ),
                            //       SizedBox(
                            //         height: 20,
                            //       ),
                            //       Text("No Data found")
                            //     ],
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: TabListBuilder(dataList:_getAllOrder.allOrderList),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: TabListBuilder(dataList:_getAllOrder.pendingList),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: TabListBuilder(dataList:_getAllOrder.pendingList),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: TabListBuilder(dataList:_getAllOrder.deliveredList),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: TabListBuilder(dataList:_getAllOrder.returnedList),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: TabListBuilder(dataList:_getAllOrder.failedList),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: TabListBuilder(dataList:_getAllOrder.cancelledList),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: TabListBuilder(dataList:_getAllOrder.confirmedList),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: TabListBuilder(dataList:_getAllOrder.outfordeliveryList),
                            ),
                          ],
                        ): Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  ],
                ),
              )

      ),
    );
  }
}
