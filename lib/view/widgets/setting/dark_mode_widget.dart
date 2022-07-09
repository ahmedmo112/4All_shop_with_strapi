import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/logic/controller/setting_controller.dart';
import 'package:fshop/logic/controller/theme_controller.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/setting/icon_widget.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         IconWidget(
            color: darkSettings,
            icon:const Icon(
              Icons.dark_mode_outlined,
            color: Colors.white,
            ),
            text: "Dark Mode".tr,
            ),
         Obx(()=>Switch(
              value: controller.isDark.value,
              onChanged: (value){
                controller.isDark.value=value;
                ThemeController().changeThemeMode();
                
          }
        ))
      ],
    );
  }
}
