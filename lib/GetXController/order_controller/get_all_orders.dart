import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../apiClient/apiClient.dart';
import '../../utils/all_order_list/allOrderListModal.dart';

class GetAllOrder extends GetxController{
  RxList<Order> allOrderList=<Order>[].obs;
  RxList<Order> pendingList=<Order>[].obs;
  RxList<Order> processingList=<Order>[].obs;
  RxList<Order> deliveredList=<Order>[].obs;
  RxList<Order> returnedList=<Order>[].obs;
  RxList<Order> failedList=<Order>[].obs;
  RxList<Order> cancelledList=<Order>[].obs;
  RxList<Order> confirmedList=<Order>[].obs;
  RxList<Order> outfordeliveryList=<Order>[].obs;




  @override
  void onInit() {
    // TODO: implement onInit
    getOrderList();
    super.onInit();
  }

  void getOrderList()async{
    var response=await ApiClint().GetAllList() ;
    if(response!=null){
      AllOrderList modal=response;
      allOrderList.value=modal.order;
      filterList();
    }
  }

  void filterList(){
    pendingList.value=allOrderList.value.where((element) => element.deliveryStatus=="pending").toList();
    processingList.value=allOrderList.value.where((element) => element.deliveryStatus=="processing").toList();
    deliveredList.value=allOrderList.value.where((element) => element.deliveryStatus=="Delivered").toList();
    returnedList.value=allOrderList.value.where((element) => element.deliveryStatus=="returned").toList();
    failedList.value=allOrderList.value.where((element) => element.deliveryStatus=="failed").toList();
    cancelledList.value=allOrderList.value.where((element) => element.deliveryStatus=="canceled").toList();
    confirmedList.value=allOrderList.value.where((element) => element.deliveryStatus!.toLowerCase().trim()=="conformed").toList();
    outfordeliveryList.value=allOrderList.value.where((element) => element.deliveryStatus=="outfordelevery").toList();
  }
}