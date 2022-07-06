import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fshop/logic/controller/product_controller.dart';
import 'package:fshop/models/product_models.dart';
import 'package:get/get.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({Key? key, required this.product}) : super(key: key);

  final ProductModel product;
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product.title.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    product.rating!.rate.toString(),
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                  RatingBarIndicator(
                    itemSize: 20,
                    unratedColor: Colors.grey.shade300,
                    rating: product.rating!.rate,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                ],
              )
            ]),
          ),
          Obx(() => InkWell(
              onTap: () {
                controller.isAtFavorite(product.id!)
                    ? controller.removeFromFavoriteList(product.id!)
                    : controller.addToFavoriteList(product.id!);
              },
              child: CircleAvatar(
                  backgroundColor: Colors.grey.shade100,
                  radius: 18,
                  child: controller.isAtFavorite(product.id!)
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border_outlined,
                          color: Colors.black)))),
        ],
      ),
    );
  }
}
