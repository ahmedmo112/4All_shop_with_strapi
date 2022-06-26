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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
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
                                    text: 'SIGN',
                                    fontsize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: mainColor),
                                SizedBox(
                                  width: 4,
                                ),
                                TextUtils(
                                    text: 'UP',
                                    fontsize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ],
                            ),
                            const SizedBox(height: 50),
                            AuthTextFormField(
                                controller: nameController,
                                hint: 'user name',
                                validator: (value) {
                                  if (value.toString().length <= 2 ||
                                      !RegExp(validationName)
                                          .hasMatch(value!) ||
                                      value.isEmpty) {
                                    return 'Please Enter Valid Name';
                                  }
                                },
                                prefix:
                                    const Icon(Icons.person, color: mainColor)),
                            const SizedBox(height: 20),
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
                                    if (value.toString().length <= 8 ||
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
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                CheckWidget(),
                                const SizedBox(width: 10),
                                const TextUtils(
                                    text: 'I Accepte ',
                                    fontsize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                const TextUtils(
                                    text: 'Terms & Conditions',
                                    fontsize: 15,
                                    textDecoration: TextDecoration.underline,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ],
                            ),
                            const SizedBox(height: 40),
                            GetBuilder<AuthController>(
                              builder: (context) {
                                return AuthButton(
                                    text: 'SIGN UP',
                                    onPressed: () {
                                      if (controller.isChacked) {
                                        if (formKey.currentState!.validate()) {
                                          controller.createAccount(
                                              "".trim(),
                                              emailController.text.trim(),
                                              passwordController.text);
                                        }

                                      }
                                      else{
                                        Get.snackbar("Check Box", "Please Accepte The Terms & Conditions");
                                      }
                                    });
                              }
                            ),
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
                  text: 'Do You Have an Account? ',
                  buttonText: 'LogIn',
                  route: Routes.loginScreen,
                ),
              ),
            ],
          )),
    );
  }
}
