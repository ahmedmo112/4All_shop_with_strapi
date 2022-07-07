import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/cart_controller.dart';
import 'package:fshop/routes/routes.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/cart/cart_item.dart';
import 'package:get/get.dart';

import '../widgets/cart/empty_cart_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "",
                      middleText:
                          "Are you sure you want to delete all Cart Items?",
                      textCancel: "No",
                      textConfirm: "Yes",
                      confirmTextColor: Colors.white,
                      cancelTextColor: Get.isDarkMode ? pinkClr : mainColor,
                      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                      onCancel: () {},
                      onConfirm: () {
                        controller.claerCartItems();
                        Get.back();
                      });
                },
                icon: const Icon(Icons.backspace))
          ],
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              // Get.offNamed(Routes.mainScreen);
              // Get.back();
              Navigator.pop(context);
            },
            icon:const Icon(Icons.arrow_back),
          ),
        ),
        body:
            controller.cartMap.isEmpty ? const EmptyCart() : CartItemsWidget(),
      ),
    ));
  }
}
