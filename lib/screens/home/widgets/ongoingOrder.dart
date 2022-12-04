import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/utils/images.dart';
import 'package:get/get.dart';

import '../../bottomNavigationBar/BottomBartab_controller.dart';

class OnGoingOrder extends StatelessWidget {
   OnGoingOrder({Key? key}) : super(key: key);
  BottomBarItemClick barItemClick = Get.put(BottomBarItemClick());
  @override
  Widget build(BuildContext context) {
    return Container(

      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OngoingOrders",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          SizedBox(
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
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2.4,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white),
                        ),
                      ) ,
                      SizedBox(height: 0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text("Pending orders",
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
                onTap: (){ barItemClick.changeIndex(1,1);},
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white),
                        ),
                      ) ,
                      SizedBox(height: 0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text("Processing order",
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){ barItemClick.changeIndex(1,3);},
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2.2,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white),
                        ),
                      ) ,
                      SizedBox(height: 0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text("Confirmed orders",
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
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2.4,
                  decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white),
                        ),
                      ) ,
                      SizedBox(height: 0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text("Out for delivery",
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
      ),
    );
  }
}
