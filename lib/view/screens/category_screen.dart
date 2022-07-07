import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/view/widgets/category/category_item_wedget.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15),
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                  child:  TextUtils(
                      text: "Categories",
                      fontsize: 27,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode?Colors.white:Colors.black
                      )),
            ),
              CategoryItemsWidget(),
          ]),
        ),
      ),
    );
  }
}
