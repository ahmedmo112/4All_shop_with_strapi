import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/auth_controller.dart';
import 'package:fshop/utils/theme.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({ Key? key }) : super(key: key);

   final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (context) {
        return InkWell(
          onTap: () {
           controller.chacked();
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius :  BorderRadius.circular(10),
              color:  Colors.grey.shade200
            ),
            child: controller.isChacked? const Icon(Icons.check,color: mainColor): Container(),
          ),
        );
      }
    );
  }
}