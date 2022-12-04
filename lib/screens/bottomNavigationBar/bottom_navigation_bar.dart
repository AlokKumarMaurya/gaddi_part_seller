import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/screens/MyOrders/Inbox.dart';
import 'package:gaddi_part_seller/screens/bottomNavigationBar/BottomBartab_controller.dart';
import 'package:get/get.dart';

import '../More/moreScreen.dart';
import '../Refund/refund_screen.dart';
import '../home/homePage.dart';

class NavigationBarScreen extends StatelessWidget {
  int? controllerValue;
  int initialIndex;
  NavigationBarScreen({Key? key,controllerValue,required this.initialIndex}) : super(key: key);

  BottomBarItemClick barItemClick = Get.put(BottomBarItemClick());

  @override
  Widget build(BuildContext context) {
    print("111111111111111111111");
    print(this.initialIndex);
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: (Get.isDarkMode)?Colors.white:Colors.black,
            unselectedItemColor: (Get.isDarkMode)?Colors.blue:Colors.black45,
            unselectedLabelStyle: (Get.isDarkMode)?TextStyle(
              color: Colors.black
            ):TextStyle(
              color: Colors.white
            ),
            showUnselectedLabels: true,
         
            onTap: (index) {
              print(index);
              barItemClick.changeIndex(index,0);
            },
            currentIndex: barItemClick.index.value,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "MyOrders"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border_sharp), label: "Refund"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view), label: "More"),
            ],
          )),
      body: Obx(() => IndexedStack(
            index: barItemClick.index.value,
            children: [HomePage(), MyOrders(controllValue:barItemClick.tabControl.value), RefundScreen(controllValue:this.controllerValue), MoreScreen()],
          )),
    );
  }
}
