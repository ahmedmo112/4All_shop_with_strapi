import 'package:flutter/material.dart';
import 'package:fshop/routes/routes.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class UnderContainer extends StatelessWidget {
  final String route;
  final String text;
  final String buttonText;
  const UnderContainer(
      {Key? key,
      required this.route,
      required this.text,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: mainColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils(
              text: text,
              fontsize: 16,
              fontWeight: FontWeight.normal,
            ),
            TextButton(
              onPressed: () {
                Get.offNamed(route);
              },
              child: TextUtils(
                text: buttonText,
                fontsize: 16,
                fontWeight: FontWeight.normal,
                textDecoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      ),
    );
  }
}
