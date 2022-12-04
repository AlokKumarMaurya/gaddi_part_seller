import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/images.dart';

class RefundScreen extends StatelessWidget {
  int? controllValue;

  RefundScreen({Key? key, controllValue}) : super(key: key);
  var isloading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Refund Request",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Image(
            image: AssetImage(ImagesConstant.Logo),
          ),
        ),
      ),
      body: Obx(
        () => (!isloading.value)
            ? DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: RefreshIndicator(
                  onRefresh: () async {
                    isloading.value = true;
                    Future.delayed(const Duration(seconds: 3)).then((value) {
                      isloading.value = false;
                    });
                  },
                  child: Column(
                    children: [
                      TabBar(
                        // indicatorColor: Colo,
                        physics: const ScrollPhysics(),
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Text(
                                "Pending",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Text(
                                "Approved",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Text(
                                "Rejected",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Text(
                                "Refunded",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image: AssetImage(ImagesConstant.No_Data),
                                    height: 250,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("No Data found")
                                ],
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image: AssetImage(ImagesConstant.No_Data),
                                    height: 250,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("No Data found")
                                ],
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image: AssetImage(ImagesConstant.No_Data),
                                    height: 250,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("No Data found")
                                ],
                              ),
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image: AssetImage(ImagesConstant.No_Data),
                                    height: 250,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text("No Data found")
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
