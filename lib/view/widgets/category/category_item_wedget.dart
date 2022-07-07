import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/category_controller.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/category/category_products_screen.dart';
import 'package:get/get.dart';

class CategoryItemsWidget extends StatelessWidget {
  CategoryItemsWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isCategoryLoading.value
        ? const CircularProgressIndicator(
            color: mainColor,
          )
        : Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return categoryItem(controller.categoryNameList[index],controller.catrgoryImages[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: controller.categoryNameList.length,
            ),
          ));
  }

  Widget categoryItem(String title,String image) => InkWell(
        onTap: () {
          controller.getProductsOfCategory(title);
          Get.to(() => CategoryProducts(categoryName: title,));

        },
        child: Container(
          width: double.infinity,
          height: 120,
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(60),
                bottomLeft: Radius.circular(60),
              ),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style:const TextStyle(
                      backgroundColor: Colors.black45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                )),
          ),
        ),
      );
}
