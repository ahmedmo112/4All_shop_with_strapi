import 'package:flutter/material.dart';
import 'package:fshop/utils/my_string.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/auth/auth_button_widget.dart';
import 'package:fshop/view/widgets/auth/auth_text_form_field.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:
            const Text('Forgot Password', style: TextStyle(color: mainColor)),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: mainColor,
            )),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const TextUtils(
                    text:
                        'If You want to recover your account, then please provide your email below...',
                    fontsize: 15,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.center,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/images/forgetpass copy.png",
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthTextFormField(
                      controller: emailController,
                      hint: 'email',
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value!) ||
                            value.isEmpty) {
                          return 'Please Enter Valid Email';
                        }
                      },
                      prefix: const Icon(Icons.email, color: mainColor)),
                  const SizedBox(
                    height: 50,
                  ),
                  AuthButton(text: 'SEND', onPressed: () {
                    if (formKey.currentState!.validate()) {
                      
                    }
                  })
                ],
              ),
            ),
          )),
    );
  }
}
