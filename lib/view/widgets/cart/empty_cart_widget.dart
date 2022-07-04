import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.shopping_cart,
          size: 150,
        ),
        Wrap(
          children: [
            TextUtils(
              text: "Your Cart is ",
              fontsize: 35,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            TextUtils(
              text: "Empty",
              fontsize: 35,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          ],
        ),
        TextUtils(
              text: "Add items to get started",
              fontsize: 17,
              fontWeight: FontWeight.normal,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
      ]),
    );
  }
}
