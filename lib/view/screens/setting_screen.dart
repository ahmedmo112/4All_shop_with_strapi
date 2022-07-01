import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/auth_controller.dart';
import 'package:fshop/logic/controller/theme_controller.dart';
import 'package:fshop/utils/theme.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: (){
              ThemeController().changeThemeMode();
            },
            child: const Text("Change Theme"),
          ),
          const SizedBox(
            height: 20,
          ),
           GetBuilder<AuthController>(
             builder: (context) {
               return TextButton(
                onPressed: (){
                  Get.defaultDialog(
                    title:"Logout",
                    middleText: "Are you sure you need to logout ?",
                    textCancel: "No",
                    textConfirm: "Yes",
                    confirmTextColor: Colors.white,
                    cancelTextColor:Get.isDarkMode? pinkClr: mainColor,
                    buttonColor: Get.isDarkMode? pinkClr:mainColor,
                    onCancel: (){},
                    onConfirm: ()=>controller.signOut()
                  );
                  
                },
                child: const Text("Log Out"),
          );
             }
           ),
        ],
      ),),
    );
  }
}