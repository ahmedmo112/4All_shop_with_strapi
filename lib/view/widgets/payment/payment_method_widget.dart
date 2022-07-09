import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  State<PaymentMethodWidget> createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {

  int radioGroup = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          buildRadioPayment(
            name: "PayPal",
            image: "assets/images/paypal.png",
            scale: 0.7,
            value: 1,
            onChanged: (value){
              setState(() {
                radioGroup = value;
              });
            }
          ),
          const SizedBox(height: 10,),
          buildRadioPayment(
            name: "Google Pay",
            image: "assets/images/google.png",
            scale: 0.8,
            value: 2,
            onChanged: (value){
              setState(() {
                radioGroup = value;
              });
            }
          ),
          const SizedBox(height: 10,),
          buildRadioPayment(
            name: "Credit Card",
            image: "assets/images/credit.png",
            scale: 0.7,
            value: 3,
            onChanged: (value){
              setState(() {
                radioGroup = value;
              });
            }
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChanged,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              scale: scale,
            ),
            const SizedBox(
              width: 1,
            ),
            TextUtils(
              text: name,
              fontsize: 20,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            )
          ],
        ),
        Radio(
            value: value,
            groupValue: radioGroup,
            onChanged: (value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.green),
          ),
      ]),
    );
  }
}
