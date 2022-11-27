import 'package:flutter/material.dart';

import '../../../utils/images.dart';

class TopSellerView extends StatelessWidget {
  const TopSellerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Seller",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(fontSize: 15, color: Colors.orange),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 15.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image(
                    image: AssetImage(ImagesConstant.Logo),
                    height: 10,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                );
              }) ,
          SizedBox(height: 25,),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Image(image: AssetImage(ImagesConstant.Logo),),
          )
        ],
      ),
    );
  }
}
