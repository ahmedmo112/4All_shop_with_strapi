import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fshop/logic/controller/auth_controller.dart';
import 'package:fshop/routes/routes.dart';
import 'package:fshop/utils/my_string.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/auth/auth_button_widget.dart';
import 'package:fshop/view/widgets/auth/auth_text_form_field.dart';
import 'package:fshop/view/widgets/auth/check_widget.dart';
import 'package:fshop/view/widgets/auth/under_container_widget.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 25, left: 25),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                TextUtils(
                                    text: 'LOG',
                                    fontsize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: mainColor),
                                TextUtils(
                                    text: 'IN',
                                    fontsize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ],
                            ),
                            const SizedBox(height: 50),
                            AuthTextFormField(
                                controller: emailController,
                                hint: 'email',
                                validator: (value) {
                                  if (!RegExp(validationEmail)
                                          .hasMatch(value!) ||
                                      value.isEmpty) {
                                    return 'Please Enter Valid Email';
                                  }
                                },
                                prefix:
                                    const Icon(Icons.email, color: mainColor)),
                            const SizedBox(height: 20),
                            GetBuilder<AuthController>(builder: (context) {
                              return AuthTextFormField(
                                  controller: passwordController,
                                  hint: 'password',
                                  validator: (value) {
                                    if (value.toString().length < 8 ||
                                        value!.isEmpty) {
                                      return 'The Password length must be 8 or more';
                                    }
                                  },
                                  isPassword: !controller.isVisable,
                                  suffix: IconButton(
                                    onPressed: () {
                                      controller.visibilty();
                                    },
                                    icon: controller.isVisable
                                        ? const Icon(
                                            Icons.visibility_off_outlined,
                                            color: Colors.grey,
                                          )
                                        : const Icon(Icons.visibility_outlined,
                                            color: Colors.grey),
                                  ),
                                  prefix:
                                      const Icon(Icons.key, color: mainColor));
                            }),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.forgetPasswordScreen);
                                },
                                child: const TextUtils(
                                    text: 'Forgot Password?',
                                    fontsize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 40),
                            GetBuilder<AuthController>(
                              builder: (context) {
                                return AuthButton(
                                    text: 'Login',
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        controller.login(emailController.text.trim(),
                                            passwordController.text);
                                      }
                                    });
                              }
                            ),
                            const SizedBox(height: 20),
                            const TextUtils(
                                text: 'OR',
                                fontsize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                            const SizedBox(height: 20),
                            GetBuilder<AuthController>(
                              builder: (context) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.googleSignUp();
                                      },
                                      child:
                                          Image.asset("assets/images/google.png"),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                            "assets/images/facebook.png")),
                                  ],
                                );
                              }
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: UnderContainer(
                  text: 'Don\'t Have an Account? ',
                  buttonText: 'Sign up',
                  route: Routes.signupScreen,
                ),
              ),
            ],
          )),
    );
  }
}
