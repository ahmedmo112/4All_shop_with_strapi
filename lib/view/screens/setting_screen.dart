import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/auth_controller.dart';
import 'package:fshop/logic/controller/theme_controller.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/cart/cart_item.dart';
import 'package:fshop/view/widgets/setting/dark_mode_widget.dart';
import 'package:fshop/view/widgets/setting/icon_widget.dart';
import 'package:fshop/view/widgets/setting/language_widget.dart';
import 'package:fshop/view/widgets/setting/profile_image_widget.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          ProfileImageWidget(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 15,
          ),
          TextUtils(
            text: "GENERAL".tr,
            fontsize: 18,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
          const SizedBox(
            height: 15,
          ),
          const DarkModeWidget(),
          const SizedBox(
            height: 15,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 15,
          ),
          //logout
          InkWell(
            onTap: () {
              Get.defaultDialog(
                  title: "Logout",
                  middleText: "Are you sure you need to logout ?",
                  textCancel: "No",
                  textConfirm: "Yes",
                  confirmTextColor: Colors.white,
                  cancelTextColor: Get.isDarkMode ? pinkClr : mainColor,
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  onCancel: () {},
                  onConfirm: () => controller.signOut());
            },
            child: IconWidget(
              color: logOutSettings,
              icon:const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              text: "Logout".tr,
            ),
          )
        ],
      ),
      // body: Center(child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     TextButton(
      //       onPressed: (){
      //         ThemeController().changeThemeMode();
      //       },
      //       child: const Text("Change Theme"),
      //     ),
      //     const SizedBox(
      //       height: 20,
      //     ),
      //      GetBuilder<AuthController>(
      //        builder: (context) {
      //          return TextButton(
      //           onPressed: (){
      //             Get.defaultDialog(
      //               title:"Logout",
      //               middleText: "Are you sure you need to logout ?",
      //               textCancel: "No",
      //               textConfirm: "Yes",
      //               confirmTextColor: Colors.white,
      //               cancelTextColor:Get.isDarkMode? pinkClr: mainColor,
      //               buttonColor: Get.isDarkMode? pinkClr:mainColor,
      //               onCancel: (){},
      //               onConfirm: ()=>controller.signOut()
      //             );

      //           },
      //           child: const Text("Log Out"),
      //     );
      //        }
      //      ),
      //   ],
      // ),),
    );
  }
}
