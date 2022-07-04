import 'package:flutter/material.dart';
import 'package:fshop/logic/controller/product_controller.dart';
import 'package:fshop/models/product_models.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Obx((){
           if(controller.favoriteList.isEmpty){
         return Center(
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
          ]));
        }else{
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.favoriteList.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 5,);
          },
          itemBuilder: (BuildContext context, int index) {
            return buildFavoriteItem(context,controller.favoriteList[index]) ;
          },
        );
        
        }
        })
        );
        
  }

  Widget buildFavoriteItem(context,ProductModel product) {
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
                      product.image!,
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
                     Text(
                      product.title!,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      style: const
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text("\$${product.price}",
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 14)),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.removeFromFavoriteList(product.id!);
                  
                },
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
