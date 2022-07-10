import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/logic/controller/cart_controller.dart';
import 'package:fshop/logic/controller/category_controller.dart';
import 'package:fshop/logic/controller/product_controller.dart';
import 'package:fshop/models/product_models.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/screens/product_details_screen.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class CategoryProducts extends StatelessWidget {
  CategoryProducts({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;

  final controller = Get.find<CategoryController>();
  final cartController = Get.find<CartController>();
  final favoriteController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text(categoryName),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.isCategoryProductsLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            childAspectRatio: 0.69,
                            mainAxisSpacing: 9.0,
                            crossAxisSpacing: 6.0,
                            maxCrossAxisExtent: 230),
                    itemCount: controller.categoryProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildCardItems(controller.categoryProducts[index].attributes!);
                    },
                  ),
                );
        }));
  }

  Widget buildCardItems(Product product) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Get.to(() => ProductDetailsScreen(
                product: product,
              ));
        },
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
                            favoriteController.isAtFavorite(product.uid!)
                                ? favoriteController
                                    .removeFromFavoriteList(product.uid!)
                                : favoriteController
                                    .addToFavoriteList(product.uid!);
                          },
                          icon: favoriteController.isAtFavorite(product.uid!)
                              ? const Icon(Icons.favorite,
                                  size: 21, color: Colors.red)
                              : Icon(Icons.favorite_outline,
                                  size: 21, color: Colors.grey.shade400)),
                      IconButton(
                          onPressed: () {
                            cartController.addProductToCart(product);
                          },
                          icon: Icon(
                            Icons.shopping_cart_outlined,
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
                            text: product.rate.toString(),
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
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 14),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
