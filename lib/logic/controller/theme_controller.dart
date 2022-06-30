import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();

  saveThemeDataToBox(bool value) {
    boxStorage.write("isDarkMode", value);
  }

  bool getThemeDataFromBox() {
    return boxStorage.read<bool>("isDarkMode") ?? false;
  }

  ThemeMode get currentTheme =>
    getThemeDataFromBox()? ThemeMode.dark : ThemeMode.light;
  

  void changeThemeMode() {
    getThemeDataFromBox()
                      ? Get.changeThemeMode(ThemeMode.light)
                      : Get.changeThemeMode(ThemeMode.dark);

    saveThemeDataToBox(!getThemeDataFromBox());
  }
}
