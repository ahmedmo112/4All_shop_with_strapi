import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/favo.png"),
            ),
            TextUtils(
              text: "There is no favorite Products",
              fontsize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            )
          ]),
        )
        // body: ListView.separated(
        //   itemCount: 10,
        //   separatorBuilder: (BuildContext context, int index) {
        //     return const SizedBox(height: 5,);
        //   },
        //   itemBuilder: (BuildContext context, int index) {
        //     return buildFavoriteItem(context) ;
        //   },
        // ),
        );
  }

  Widget buildFavoriteItem(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                color: Colors.white,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "TITLE TITLE TITLE TITLE TITLE TITLE TITLE TITLE",
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("\$100",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 14)),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
