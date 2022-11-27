import 'package:get/get.dart';


class BottomBarItemClick extends GetxController{
  var index=0.obs;

  void changeIndex(int ind){
    print(ind);
    index.value=ind;
  }
}