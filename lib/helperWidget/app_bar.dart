import 'package:flutter/material.dart';

import '../utils/images.dart';

class App_Bar {
  AppBar CustomAppBar = AppBar(
    backgroundColor: Colors.blue,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Image(
        image: AssetImage(ImagesConstant.Logo),
      ),
    ),
    // actions: [
    //   IconButton(
    //       onPressed: () {},
    //       icon: Icon(
    //         Icons.shopping_cart_outlined,
    //         color: Colors.black,
    //       ))
    // ],
  );
}
