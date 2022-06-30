

import 'package:fshop/view/screens/category_screen.dart';
import 'package:fshop/view/screens/favorite_screen.dart';
import 'package:fshop/view/screens/home_screen.dart';
import 'package:fshop/view/screens/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  RxInt currentIndex = 0.obs;
  bool isDark =false;

  final tabs =  [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const SettingScreen()
  ].obs;

  final titles = [
    "ForAll Shop",
    "Category",
    "Favorite",
    "Settings",
  ].obs;

  void switchTheme(){
    isDark = !isDark;
  }
}