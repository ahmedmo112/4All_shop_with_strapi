import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fshop/firebase_options.dart';
import 'package:fshop/routes/routes.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FShop',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      initialRoute: AppRoutes.welcome,
      getPages:AppRoutes.routes,
    );
  }
}

