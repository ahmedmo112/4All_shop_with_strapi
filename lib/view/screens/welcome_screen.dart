import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:fshop/routes/routes.dart';
import 'package:fshop/utils/theme.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/images/background.jpg',fit: BoxFit.cover,),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 200,),
                  const TextUtils(text: 'Welcome', fontsize: 35, fontWeight: FontWeight.bold),
                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextUtils(text: '4ALL', fontsize: 35, fontWeight: FontWeight.bold,color: mainColor),
                      SizedBox(width: 10,),
                    TextUtils(text: 'Shop', fontsize: 35, fontWeight: FontWeight.bold,),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:const EdgeInsets.symmetric(horizontal:40,vertical:12)
                    ),
                    onPressed: (){
                      Get.offNamed(Routes.loginScreen);
                    },
                     child:const TextUtils(text: 'Get Start', fontsize: 22, fontWeight: FontWeight.bold),
                     ),
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const TextUtils(text: 'Don\'t have an Account', fontsize: 18, fontWeight: FontWeight.normal,),
                      const SizedBox(width: 3,),
                      TextButton(
                        onPressed: (){
                        Get.offNamed(Routes.signupScreen);

                        },
                        child: const TextUtils(
                          text: 'Sign Up',
                           fontsize: 18,
                            fontWeight: FontWeight.normal,
                            textDecoration: TextDecoration.underline
                            ),
                        
                        )
                    ],
                  ),
                  const SizedBox(height: 70,),

                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}