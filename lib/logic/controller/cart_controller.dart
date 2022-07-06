import 'package:flutter/material.dart';
import 'package:fshop/logic/bindings/products_bindings.dart';
import 'package:fshop/models/product_models.dart';
import 'package:fshop/utils/theme.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxMap<ProductModel, int> cartMap = <ProductModel, int>{}.obs;

  double total = 0;

  @override
  void onInit() {
    calcTotalPrice();
    super.onInit();
  }

  void addProductToCart(ProductModel product) {
    if (!cartMap.containsKey(product)) {
      cartMap[product] = 1;
    } else {
      int num = cartMap[product]! + 1;
      cartMap[product] = num;
    }
    Get.snackbar(
      "Info",
      "Added To Your Cart Successfully!",
      colorText: Colors.white,
      backgroundColor: Colors.green.withOpacity(0.5),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 25),
    );
    calcTotalPrice();
  }

  void removeProductFromCart(ProductModel product) {
    if (cartMap.containsKey(product)) {
      if (cartMap[product] != 1) {
        int num = cartMap[product]! - 1;
        cartMap[product] = num;
      } else {
        removeOneProduct(product);
      }
    }
    calcTotalPrice();
  }

  void removeOneProduct(ProductModel product) {
    cartMap.remove(product);
    calcTotalPrice();
  }

  void claerCartItems() {
    cartMap.clear();
    calcTotalPrice();
  }

  void calcTotalPrice() {
    total = 0;
    cartMap.forEach((key, value) {
      total = total + (key.price * value);
    });
  }
}
