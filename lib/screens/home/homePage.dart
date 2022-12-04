import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/screens/home/widgets/ongoingOrder.dart';
import 'package:gaddi_part_seller/screens/home/widgets/completedOrders.dart';
import 'package:gaddi_part_seller/screens/home/widgets/monthlyEarning.dart';
import 'package:get/get.dart';
import '../../helperWidget/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLoading = false.obs;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: App_Bar().CustomAppBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: RefreshIndicator(
          onRefresh: () async {
            isLoading.value=true;
            Future.delayed(Duration(seconds: 3)).then((value){
              isLoading.value=false;
            });
          },
          child: Obx(()=>(!isLoading.value)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      OnGoingOrder(),
                      SizedBox(
                        height: 30,
                      ),
                      CompletedOrders(),
                      SizedBox(
                        height: 30,
                      ),
                      MonthlyEarning(),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
        ),
      ),
    );
  }
}
