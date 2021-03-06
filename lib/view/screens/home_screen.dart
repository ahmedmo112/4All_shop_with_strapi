import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../widgets/home/card_Items.dart';
import '../widgets/home/search_form_text_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: CustomScrollView(
            physics:const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: false,
                snap: false,
                floating: true,
                backgroundColor: Colors.transparent,
                expandedHeight: 210,
                flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.fadeTitle,
                      StretchMode.blurBackground,
                    ],
                    background: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Get.isDarkMode ? pinkClr : mainColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                )),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextUtils(
                                      text: "Find Your".tr,
                                      fontsize: 25,
                                      fontWeight: FontWeight.bold),
                                  const SizedBox(height: 5),
                                   TextUtils(
                                      text: "INSPIRATION".tr,
                                      fontsize: 28,
                                      fontWeight: FontWeight.w800),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: SearchFormText()),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.sort,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: TextUtils(
                              text: "Products".tr,
                              fontsize: 20,
                              fontWeight: FontWeight.w900,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CardItems(),
                    ],
                  );
                }, childCount: 1),
              ),
            ],
          )),
    );
  }
}
