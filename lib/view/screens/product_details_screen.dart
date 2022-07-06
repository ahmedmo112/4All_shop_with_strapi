import 'package:flutter/material.dart';
import 'package:fshop/models/product_models.dart';
import 'package:fshop/view/widgets/ProductDetails/image_slider_widget.dart';
import 'package:get/get.dart';

import '../widgets/ProductDetails/product_info_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(imageUrl: product.image!),
            ProductInfo(product: product),
            // SizeList(),
          ],
        )),
      ),
    );
  }
}
