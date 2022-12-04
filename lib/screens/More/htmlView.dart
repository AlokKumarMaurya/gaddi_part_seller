import 'package:flutter/material.dart';
import 'package:gaddi_part_seller/helperWidget/app_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
class HtmlContentViewer extends StatelessWidget {
  const HtmlContentViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("${Get.arguments["title"]}"),
      ),
      body: SingleChildScrollView(
        child: Html(data:"${Get.arguments["html"]}"),
      ),
    );
  }
}
