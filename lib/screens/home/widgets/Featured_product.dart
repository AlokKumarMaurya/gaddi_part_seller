import 'package:flutter/material.dart';

import '../../../utils/images.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Product",
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
            height: 15,
          ),
          Container(
            height: 70,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                       color: Colors.grey.shade300,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage(ImagesConstant.Logo),
                          height: 40,width: 40,
                        ),
                      ),
                    ),
                  );
                }),
          )

        ],
      ),
    );
  }
}
