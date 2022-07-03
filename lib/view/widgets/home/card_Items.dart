import 'package:flutter/material.dart';
import 'package:fshop/logic/bindings/main_bindings.dart';
import 'package:fshop/models/product_models.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../../../logic/controller/product_controller.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: mainColor,
        ));
      } else {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.69,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 230),
              itemCount: controller.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return buildCardItems(controller.productList[index]);
              },
            ),
          ),
        );
      }
    });
  }

  Widget buildCardItems(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.grey.shade900 : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Get.isDarkMode
                      ? Colors.black.withOpacity(0.5)
                      : Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 8)
            ]),
        child: Column(
          children: [
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                IconButton(
                    onPressed: () {
                      controller.isAtFavorite(product.id!)?
                      controller.removeFromFavoriteList(product.id!):
                      controller.addToFavoriteList(product.id!);
                    },
                    icon: controller.isAtFavorite(product.id!)
                        ? 
                         const Icon(Icons.favorite,
                            size: 21, color: Colors.red):
                            const Icon(
                            Icons.favorite_outline,
                            size: 21,
                          )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 21,
                      color: Colors.grey.shade400,
                    )),
              ],
            )),
            Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(
                        product.image!,
                      ),
                      fit: BoxFit.fitHeight,
                    ))),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                    text: "\$${product.price}",
                    fontsize: 14,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  Container(
                    width: 45,
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextUtils(
                          text: product.rating!.rate.toString(),
                          fontsize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0) +
                  const EdgeInsets.symmetric(horizontal: 1),
              child: Text(
                product.title.toString(),
                overflow: TextOverflow.fade,
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}