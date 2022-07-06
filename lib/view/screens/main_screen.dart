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
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
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
          title: Text(controller.titles[controller.currentIndex.value]),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                activeIcon: Icon(
                  Icons.home,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Category",
                activeIcon: Icon(
                  Icons.category,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorite",
                activeIcon: Icon(
                  Icons.favorite,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                activeIcon: Icon(
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
    }));
  }
}
