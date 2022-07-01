import 'package:fshop/logic/bindings/auth_bindings.dart';
import 'package:fshop/logic/bindings/main_bindings.dart';
import 'package:fshop/logic/bindings/products_bindings.dart';
import 'package:fshop/view/screens/auth/forget_password_screen.dart';
import 'package:fshop/view/screens/auth/login_screen.dart';
import 'package:fshop/view/screens/auth/signup_screen.dart';
import 'package:fshop/view/screens/main_screen.dart';
import 'package:fshop/view/screens/welcome_screen.dart';
import 'package:fshop/view/widgets/auth/auth_button_widget.dart';
import 'package:get/get.dart';

class AppRoutes {
  //initialRoute
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  //getPage

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.signupScreen,
        page: () => SignUpScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgetPasswordScreen,
        page: () => ForgetPasswordScreen(),
        binding: AuthBinding()),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [AuthBinding(),MainBinding(),ProductBinding()]
    ),
  ];
}

class Routes {
  static const welcomeScreen = "/welcomeScreen";
  static const loginScreen = "/loginScreen";
  static const signupScreen = "/signupScreen";
  static const forgetPasswordScreen = "/forgetPasswordScreen";
  static const mainScreen = "/mainScreen";
}
