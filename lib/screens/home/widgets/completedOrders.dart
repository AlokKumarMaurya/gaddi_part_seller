import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/images.dart';
import '../../MyOrders/Inbox.dart';
import '../../bottomNavigationBar/BottomBartab_controller.dart';
import '../../bottomNavigationBar/bottom_navigation_bar.dart';

class CompletedOrders extends StatelessWidget {
  CompletedOrders({Key? key}) : super(key: key);
  BottomBarItemClick barItemClick = Get.put(BottomBarItemClick());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Completed orders",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  barItemClick.changeIndex(1,0);
                  //  Get.to(NavigationBarScreen(initialIndex: 1,controllerValue:0 ,));

                },
                child: Card(
                  child: Row(
                    children: [
                      Icon(
                        Icons.ac_unit_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Deleivered",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                          child: Container(
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  barItemClick.changeIndex(1,1);
                },
                child: Card(
                  child: Row(
                    children: [
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Cancelled",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                          child: Container(
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  barItemClick.changeIndex(1,2);
                },
                child: Card(
                  child: Row(
                    children: [
                      Icon(
                        Icons.ac_unit_outlined,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Returned",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                          child: Container(
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  barItemClick.changeIndex(1,3);
                },
                child: Card(
                  child: Row(
                    children: [
                      Icon(
                        Icons.cancel_presentation_sharp,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Failed",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                          child: Container(
                        height: 40,
                        alignment: Alignment.centerRight,
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                        ),
                      )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          )
        ],
      ),
    );
  }
}
