import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/logic/controller/auth_controller.dart';
import 'package:fshop/logic/controller/payment_controller.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryWidget> createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {
  TextEditingController phoneController = TextEditingController();
  int radioGroup = 1;
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();
  bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            color: changeColor ? Colors.white : Colors.grey.shade300,
            value: 1,
            onChanged: (value) {
              setState(() {
                radioGroup = value!;
                changeColor = !changeColor;
              });
            },
            title: "From Store",
            name: "ForALL Shop",
            phone: "06973",
            address: "17-Al Haram-Giza-Egypt",
            icon: Container()),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => buildRadioContainer(
            color: changeColor ? Colors.grey.shade300 : Colors.white,
            value: 2,
            onChanged: (value) {
              setState(() {
                radioGroup = value!;
                changeColor = !changeColor;
              });
              controller.updatePostion();
            },
            title: "Delivery",
            name: authController.displayUserName.value,
            phone: controller.phoneNumber.value,
            address: controller.address.value,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                    title: "Enter Your Phone Number",
                    radius: 10,
                    textCancel: "Cancel",
                    textConfirm: "Save",
                    cancelTextColor: mainColor,
                    confirmTextColor: Colors.white,
                    buttonColor: mainColor,
                    onCancel: () {
                      Get.back();
                    },
                    onConfirm: () {
                      controller.phoneNumber.value = phoneController.text;
                    },
                    content: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: phoneController,
                        maxLength: 11,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.phone,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                        decoration: InputDecoration(
                          fillColor: mainColor.withOpacity(0.2),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: mainColor,
                          ),
                          hintText: "Enter Your Phone Number",
                          hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ));
              },
              child: const Icon(
                Icons.edit,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String title,
    required String name,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 125,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioGroup,
            onChanged: (value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: title,
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                    text: name,
                    fontsize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text("\u{1F1EA}\u{1F1EC} +20 "),
                    TextUtils(
                        text: phone,
                        fontsize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                    
                    const SizedBox(
                  width: 100,
                ),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                    text: address,
                    fontsize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ],
            ),
          )
        ],
      ),
    );
  }
}
