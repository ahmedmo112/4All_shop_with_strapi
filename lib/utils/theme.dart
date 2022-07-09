import 'package:flutter/material.dart';

const Color mainColor = Colors.amber;
const Color darkGreyClr = Color(0xFF121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Colors.black;
const Color kCOlor2 = Colors.white;
const Color kCOlor3 = Colors.amber;
const Color kCOlor4 = Colors.greenAccent;
const Color kCOlor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffCB256C);

class ThemesApp {
  static final light = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: mainColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey.shade400),
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: pinkClr),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: pinkClr,
        unselectedItemColor: Colors.grey.shade400,
        backgroundColor: darkGreyClr),
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
