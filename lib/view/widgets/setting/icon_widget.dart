import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class IconWidget extends StatelessWidget {
  const IconWidget(
      {Key? key, required this.color, required this.icon, required this.text})
      : super(key: key);
  final Color color;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: color,
          child: icon,
        ),
        const SizedBox(
          width: 10,
        ),
        TextUtils(
          text: text,
          fontsize: 17,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        )
      ],
    );
  }
}
