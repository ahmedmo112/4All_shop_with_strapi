import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../widgets/home/search_form_text_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration:  BoxDecoration(
                color: Get.isDarkMode? pinkClr:mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextUtils(text: "Find Your", fontsize: 25, fontWeight: FontWeight.bold),
                    const SizedBox(height: 5),
                    const TextUtils(text: "INSPIRATION", fontsize: 28, fontWeight: FontWeight.w800),
                    const SizedBox(height: 20),
                    SearchFormText(controller: searchController,),

                ],),
              )
            )
          ]),
      ),
    );
  }
}