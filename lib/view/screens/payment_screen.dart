import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/logic/controller/cart_controller.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/bottom_bar_widget.dart';
import 'package:fshop/view/widgets/payment/delivery_widget.dart';
import 'package:fshop/view/widgets/payment/payment_method_widget.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text("Payment".tr),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: "Shipping To".tr,
                fontsize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const DeliveryWidget(),
              const SizedBox(
                height: 20,
              ),
              TextUtils(
                text: "Payment method".tr,
                fontsize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentMethodWidget(),
              const SizedBox(
                height: 30,
              ),
              BottomBar(
                  subtitle: "Total".tr,
                  price: cartController.total,
                  buttonTitle: TextUtils(
                      text: "Pay Now".tr,
                      fontsize: 18,
                      fontWeight: FontWeight.bold),
                  onTap: () {
      
                  }),
             
            ],
          ),
        ),
      ),
    );
  }
}
