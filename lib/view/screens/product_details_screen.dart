import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/cart_controller.dart';
import 'package:fshop/models/product_models.dart';
import 'package:fshop/view/widgets/ProductDetails/image_slider_widget.dart';
import 'package:fshop/view/widgets/ProductDetails/size_widget.dart';
import 'package:fshop/view/widgets/bottom_bar_widget.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../widgets/ProductDetails/product_info_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageSlider(imageUrl: product.image!),
                    ProductInfo(product: product),
                    const SizeWidget(),
                  ],
                )),
              ),
            ),
            
            BottomBar(
              subtitle: "Price",
              price: product.price,
              buttonTitle: Row(
                children: const [
                  TextUtils(
                      text: "Add To Cart  ",
                      fontsize: 18,
                      fontWeight: FontWeight.bold),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )
                ],
              ),
              onTap: () {
                controller.addProductToCart(product);
              },
            )
          ],
        ),
      ),
    );
  }
}
