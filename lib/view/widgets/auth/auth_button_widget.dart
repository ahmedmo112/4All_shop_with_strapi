import 'package:flutter/material.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({Key? key,required this.text,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: mainColor, minimumSize: const Size(350, 50)),
      child: TextUtils(
          text: text,
          fontsize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
