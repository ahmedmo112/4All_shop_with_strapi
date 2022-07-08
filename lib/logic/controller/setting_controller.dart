import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{

  void setAppLangoage(String lang){
    Get.updateLocale(Locale(lang));
    update();
  }
}