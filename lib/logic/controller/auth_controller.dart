

import 'package:get/get.dart';

class AuthController extends GetxController{
  bool isVisable = false;
  bool isChacked = false;

  void visibilty(){
    isVisable = !isVisable;

    update();
  }

  void chacked(){
    isChacked = !isChacked;
    update();
  }
}