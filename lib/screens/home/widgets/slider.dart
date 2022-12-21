import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/utils/images.dart';
import 'package:get/get.dart';

import '../../../GetXController/Dashboard_page/getx_dashboard_controller.dart';

class SliderWidget extends StatelessWidget {
  SliderWidget({Key? key,}) : super(key: key);
  DashboardController _dashboardController=Get.put(DashboardController());
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    debugPrint(_dashboardController.sliderContent.length.toString());
    debugPrint("_dashboardController.sliderContent.length.toString()");
    return Obx(()=>(_dashboardController.sliderContent.length>0)?Container(
      child: CarouselSlider.builder(itemCount: _dashboardController.sliderContent.length,
           options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        enlargeCenterPage: true,
        disableCenter: true,
        onPageChanged: (index, reason) {
        },
      ),
        itemBuilder: (context,index,_){
        return Container(
          child: Image.network("${_dashboardController.sliderContent[index].photo}",
            errorBuilder: (context, error, stackTrace) {
              return Container(
                child: Image.asset(ImagesConstant.logo),
              );
            },),
        );
        }
      ),
    ):Container());

  }
}
