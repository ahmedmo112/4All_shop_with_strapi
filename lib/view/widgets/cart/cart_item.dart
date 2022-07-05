import 'package:flutter/material.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../../../logic/controller/cart_controller.dart';
import '../../../models/product_models.dart';
import '../../../utils/theme.dart';

class CartItemsWidget extends StatelessWidget {
  CartItemsWidget({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        Expanded(
            child: Container(
          width: double.infinity,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildCartItem(
                    context,
                    controller.cartMap.keys.elementAt(index),
                    controller.cartMap.values.elementAt(index));
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: controller.cartMap.keys.length),
        )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total",
                      style: Theme.of(context).textTheme.caption!,
                    ),
                    TextUtils(
                      text: "\$${controller.total.toStringAsFixed(2)}",
                      fontsize: 15,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Get.isDarkMode ? pinkClr : mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12)),
                    onPressed: () {},
                    child: const TextUtils(
                        text: 'Check Out',
                        fontsize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCartItem(context, ProductModel product, int count) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              SizedBox(
                child: Card(
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        product.image.toString(),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.title.toString(),
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text("\$${product.price}",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14)),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    InkWell(
                      onTap: () {
                        controller.addProductToCart(product);
                      },
                      child: CircleAvatar(
                        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                        radius: 10,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(count.toString()),
                    ),
                    InkWell(
                      onTap: () {
                        controller.removeProductFromCart(product);
                      },
                      child: CircleAvatar(
                        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                        radius: 10,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ]),
                  IconButton(
                      onPressed: () {
                        controller.removeOneProduct(product);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              ),
            ],
          ),
        ),
      );
}
