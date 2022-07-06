import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/logic/controller/cart_controller.dart';
import 'package:fshop/routes/routes.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/ProductDetails/color_picker.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final String imageUrl;
  const ImageSlider({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final controller = Get.find<CartController>();

  CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;
  List<Color> colorsList = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 4),
              viewportFraction: 1,
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemBuilder: (context, index, cIndex) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.imageUrl)),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Get.isDarkMode ? pinkClr : mainColor),
          ),
        )),
        Positioned.fill(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 220,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(30)),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentColor = index;
                          });
                        },
                        child: ColorPicker(
                            outerBorder: currentColor == index,
                            color: colorsList[index]));
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 3,
                    );
                  },
                  itemCount: colorsList.length),
            ),
          ),
        )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  backgroundColor: Get.isDarkMode
                      ? pinkClr.withOpacity(0.5)
                      : mainColor.withOpacity(0.5),
                  radius: 19,
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              Obx(() => InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: CircleAvatar(
                      backgroundColor: mainColor.withOpacity(0.5),
                      radius: 19,
                      child: Badge(
                          position: BadgePosition.topEnd(),
                          badgeContent:
                              Text(controller.cartMap.keys.length.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                          child: const Icon(Icons.shopping_cart,
                              color: Colors.white)),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
