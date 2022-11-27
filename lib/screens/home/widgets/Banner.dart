import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/images.dart';

class BannerView extends StatefulWidget {
  BannerView({Key? key}) : super(key: key);

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  PageController pageController = PageController();
      int   currentPage=0;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if(currentPage==5)
        {
          currentPage=0;
        }   else{
        currentPage++;
        pageController.animateToPage(currentPage, duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,) ;
      }
    })  ;
    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),
       
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
            ),
          height: 130,
          child:
              PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return   Banner(
                    message: "20% off !!",
                    location: BannerLocation.bottomStart,
                    color: Colors.red,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12)
                      ),

                      // height: 300,
                      child: Column(
                          children: <Widget>[
                            SizedBox(height: 10,),
                            Image(image: AssetImage(ImagesConstant.Logo),height: 130,)  ,
                            // const SizedBox(height: 10),
                            // const Text(
                            //   'Gaddi Part',
                            //   style: TextStyle(
                            //       color: Colors.green,
                            //       fontSize: 40,
                            //       fontWeight: FontWeight.bold), //TextStyle
                            // ),
                            // const SizedBox(
                            //   height: 0,
                            // ), //SizedBox
                            // const Text(
                            //   'Get for free',
                            //   style: TextStyle(
                            //       color: Colors.green,
                            //       fontSize: 20,
                            //       fontWeight: FontWeight.bold), //TextStyle
                            // ), //Text

                          ], //<Widget>[]
                        ), //Column
                      ), //Padding
                   //Container
                  );
                },
              )

        ));
  }
}
