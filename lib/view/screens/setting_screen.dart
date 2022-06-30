import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/theme_controller.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(child: TextButton(
        onPressed: (){
          ThemeController().changeThemeMode();
        },
        child: const Text("Change Theme"),
      ),),
    );
  }
}