import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/screens/bottomNavigationBar/tab_controller.dart';
import 'package:get/get.dart';

import '../home/homePage.dart';
import '../inbox/Inbox.dart';

class NavigationBarScreen extends StatelessWidget {
  NavigationBarScreen({Key? key}) : super(key: key);

  BottomBarItemClick barItemClick = Get.put(BottomBarItemClick());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black45,
            onTap: (index) {
              print(index);
              barItemClick.changeIndex(index);
            },
            currentIndex: barItemClick.index.value,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "Inbox"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border_sharp), label: "Orders"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view), label: "More"),
            ],
          )),
      body: Obx(() => IndexedStack(
            index: barItemClick.index.value,
            children: [HomePage(), InboxScreen(), HomePage(), HomePage()],
          )),
    );
  }
}
