import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/cart_controller.dart';
import 'package:fshop/logic/controller/main_controller.dart';
import 'package:fshop/routes/routes.dart';
import 'package:fshop/utils/theme.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: 
         AppBar(
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  icon: Badge(
                    position: BadgePosition.topEnd(),
                    badgeContent: Text(cartController.cartMap.keys.length.toString(),style: const TextStyle(color: Colors.white,)),
                    child: const Icon(Icons.shopping_bag_outlined))),
            )
          ],
          title:controller.currentIndex.value==0? SizedBox(
                    width: 100,
                    child: Image.asset("assets/images/logo.png"),
                    )
                    :Text(controller.titles[controller.currentIndex.value].tr),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items:  [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: "Home".tr,
                activeIcon: const Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
                icon:const Icon(Icons.category),
                label: "Category".tr,
                activeIcon: const Icon(
                  Icons.category,
                )),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: "Favorities".tr,
                activeIcon:const  Icon(
                  Icons.favorite,
                )),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: "Settings".tr,
                activeIcon:const Icon(
                  Icons.settings,
                )),
          ],
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
            index: controller.currentIndex.value, children: controller.tabs),
      );
    });
  }
}
