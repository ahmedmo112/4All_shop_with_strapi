
import 'dart:html';

import 'package:fshop/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/product_models.dart';

class ProductController extends GetxController{
  RxList productList = <ProductModel> [].obs;
  RxList? favoriteList = <ProductModel> [].obs;
  RxBool isLoading = true.obs;

  GetStorage storage = GetStorage();


  @override
  void onInit() {
    getProducts();
    readFavorite();
    super.onInit();
  }

  void getProducts()async{
    List<ProductModel> products = await ProductServices.getProducts();

    try {
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void readFavorite(){
    List list = storage.read<List>("favorities")!;
    if(list != null){
     favoriteList =  list.map((element) => ProductModel.fromJson(element)).toList().obs;
    }
  }

  void addToFavoriteList(int productId)async{

    favoriteList!.add(productList
    .firstWhere((element) => element.id == productId));
    print(productId);
    await storage.write("favorities", favoriteList);
  }

  void removeFromFavoriteList(int productId)async{
    for (var i = 0; i < favoriteList!.length; i++) {
      if (productId == favoriteList![i].id) {
        favoriteList!.removeAt(i);
      }
    }
    await storage.write("favorities", favoriteList);
  }

  bool isAtFavorite(int productId){
    return favoriteList!.any((element) => element.id == productId);
  }

}