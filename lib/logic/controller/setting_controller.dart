import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/theme_controller.dart';
import 'package:fshop/utils/my_string.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController{
  RxBool isDark = ThemeController().getThemeDataFromBox().obs;
  String? lang;

  GetStorage langBox = GetStorage();

  @override
  void onInit() {
    super.onInit();
    lang =  langBox.read("lang")??en;
    setAppLangoage(lang!);
  }

  void savecurrentlnguage(String lang)async{
    await langBox.write("lang", lang);
  }

  void setAppLangoage(String lang){
    savecurrentlnguage(lang);
    Get.updateLocale(Locale(lang));
    update();
  }
}