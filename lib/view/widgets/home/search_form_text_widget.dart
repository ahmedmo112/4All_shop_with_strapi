import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (context) {
      return TextField(
        controller: controller.searchTextController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (search) {
          controller.addSearchToList(search);
        },
        decoration: InputDecoration(
          suffixIcon: 
          controller.searchTextController.text.isNotEmpty?
           IconButton(
            onPressed: () {
              controller.clearSearch();
            },
            icon:const Icon(Icons.close,color: Colors.black,),
          ): null,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: "Search you're looking for",
          hintStyle: const TextStyle(
              color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w500),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    });
  }
}
