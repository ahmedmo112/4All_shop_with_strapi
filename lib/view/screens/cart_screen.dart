import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart/empty_cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          centerTitle: true,
          actions: [IconButton(onPressed: (){}, icon:const  Icon(Icons.backspace))],
          elevation: 0.0,

        ),
        body: EmptyCart(),
      ),
    );
  }
}