import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/utils/images.dart';
import 'package:get/get.dart';

import '../../../GetXController/Dashboard_page/getx_dashboard_controller.dart';

class SliderWidget extends StatelessWidget {
 const SliderWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController _dashboardController=Get.put(DashboardController());
    return Container(
      height: 150,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color: Colors.grey.shade400,
      child: Obx(()=>PageView.builder(

        onPageChanged: (value){
          debugPrint(value.toString());
        },

        controller: PageController(keepPage: false, initialPage: _dashboardController.slidePageController.value,),
        itemCount: _dashboardController.sliderContent.length,
        itemBuilder: (context, index) {
          return Container(
            child: Image.network("${_dashboardController.sliderContent[index]}",
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  child: Image.asset(ImagesConstant.logo),
                );
              },),
          );
        },
      )));

  }
}
