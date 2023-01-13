import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../GetXController/Dashboard_page/getx_dashboard_controller.dart';
import '../../bottomNavigationBar/BottomBartab_controller.dart';

class OnGoingOrder extends StatelessWidget {
   OnGoingOrder({Key? key}) : super(key: key);
  BottomBarItemClick barItemClick = Get.put(BottomBarItemClick());
   DashboardController _dashboardController=Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>(_dashboardController.allDashBoard.value.isEmpty)?Center(child: CircularProgressIndicator(),):Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ongoing Orders",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height:20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              hoverColor: Colors.white,
              onTap: (){
                barItemClick.changeIndex(1,0);
              },
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width / 2.4,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0,top:5),
                      child: Obx(()=>Text(
                        "${_dashboardController.allDashBoard.value[0].totalProduct}",
                        maxLines: 2,
                        style: TextStyle(

                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white),
                      )),
                    ) ,
                    Container(
                      padding: EdgeInsets.only(left: 25,top:0),
                      child: Text("Products",
                        maxLines: 2,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white),),
                    )

                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){ barItemClick.changeIndex(1,1);},
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width / 2.4,
                decoration: BoxDecoration(
                    color: Colors.blue.shade600,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0,top: 5),
                      child: Obx(()=>Text(
                        "${_dashboardController.allDashBoard.value[0].totalSale}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white),
                      )),
                    ) ,
                    Container(
                      padding: EdgeInsets.only(left: 25,top: 0),
                      child: Text("Total Sales",
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white),),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){ barItemClick.changeIndex(1,3);},
              child: Container(
                height: 90,
                width:MediaQuery.of(context).size.width / 2.4,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0,top: 0),
                      child: Text(
                        "0",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white),
                      ),
                    ) ,
                    Container(
                      padding: EdgeInsets.only(left: 25,top: 0),
                      child: Text("Total Earnings",
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Colors.white),),
                    )

                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){ barItemClick.changeIndex(1,3);},
              child: Container(
                height: 90,
                width: MediaQuery.of(context).size.width / 2.4,
                decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0,top: 0),
                      child: Obx(() =>Text(
                        "${_dashboardController.allDashBoard.value[0].successOrder}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white),
                      )),
                    ) ,
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 0),
                    child: Text("Success Orders",
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white),),
                  )

                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
