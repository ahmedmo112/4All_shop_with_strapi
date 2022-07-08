import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/logic/controller/theme_controller.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/setting/icon_widget.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const IconWidget(
            color: darkSettings,
            icon: Icon(
              Icons.dark_mode_outlined,
            color: Colors.white,
            ),
            text: "Dark Mode",
            ),
        Switch(
          value: Get.isDarkMode,
          onChanged: (value){
            ThemeController().changeThemeMode();
          },

        )
      ],
    );
  }
}
