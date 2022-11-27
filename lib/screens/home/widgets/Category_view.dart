import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/utils/images.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
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
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 20.0,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image(
                      image: AssetImage(ImagesConstant.Logo),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
