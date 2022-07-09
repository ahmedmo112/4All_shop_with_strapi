import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/logic/controller/setting_controller.dart';
import 'package:fshop/utils/my_string.dart';
import 'package:fshop/utils/theme.dart';
import 'package:get/get.dart';

import 'icon_widget.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             IconWidget(
              color: languageSettings,
              icon:const Icon(
                Icons.language,
                color: Colors.white,
              ),
              text: "Language".tr,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.lang,
                    items: [
                      DropdownMenuItem(child: Text(english),value: en,),
                      DropdownMenuItem(child: Text(arabic),value: ar,),
                    ],
                    onChanged: (value) {
                      controller.lang = value;
                      controller.setAppLangoage(value!);
                    },
                  ),
                )),
          ],
        );
      }
    );
  }
}
