

import 'package:fshop/view/screens/category_screen.dart';
import 'package:fshop/view/screens/favorite_screen.dart';
import 'package:fshop/view/screens/home_screen.dart';
import 'package:fshop/view/screens/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  RxInt currentIndex = 0.obs;
  

  final tabs =  [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen()
  ].obs;

  final titles = [
    "ForAll Shop",
    "Category",
    "Favorite",
    "Settings",
  ].obs;


}