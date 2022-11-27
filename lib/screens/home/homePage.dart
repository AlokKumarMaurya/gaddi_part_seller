import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/screens/home/widgets/Banner.dart';
import 'package:gaddi_part_seller/screens/home/widgets/Category_view.dart';
import 'package:gaddi_part_seller/screens/home/widgets/Featured_product.dart';
import 'package:gaddi_part_seller/screens/home/widgets/brandes_view.dart';
import 'package:gaddi_part_seller/screens/home/widgets/searchBar.dart';
import 'package:gaddi_part_seller/screens/home/widgets/top_sellerView.dart';
import '../../helperWidget/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: App_Bar().CustomAppBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(),
              SizedBox(
                height: 10,
              ),
              BannerView(),
              SizedBox(
                height: 20,
              ),
              CategoryView()  ,
              SizedBox(height: 30,),
              BrandsView() ,
              SizedBox(height: 30,),
                TopSellerView()  ,
              SizedBox(height: 30,),
              FeaturedProduct()
            ],
          ),
        ),
      ),
    );
  }
}
