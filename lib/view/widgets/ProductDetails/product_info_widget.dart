import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fshop/logic/controller/product_controller.dart';
import 'package:fshop/models/product_models.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({Key? key, required this.product}) : super(key: key);

  final Product product;
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Row(
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
                        product.rate.toString(),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      RatingBarIndicator(
                        itemSize: 20,
                        unratedColor: Colors.grey.shade300,
                        rating: product.rate!,
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
                    controller.isAtFavorite(product.uid!)
                        ? controller.removeFromFavoriteList(product.uid!)
                        : controller.addToFavoriteList(product.uid!);
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      radius: 18,
                      child: controller.isAtFavorite(product.uid!)
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_border_outlined,
                              color: Colors.black)))),
            ],
          ),
          const SizedBox(height: 20,),
          ReadMoreText(
            product.description.toString(),
            trimLines: 3,
            moreStyle:const TextStyle(color: Colors.blue),
            lessStyle:const TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
