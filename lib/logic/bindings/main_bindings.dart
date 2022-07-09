
import 'package:fshop/logic/controller/main_controller.dart';
import 'package:fshop/logic/controller/payment_controller.dart';
import 'package:fshop/logic/controller/setting_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PaymentController(),permanent: true);
  }

}