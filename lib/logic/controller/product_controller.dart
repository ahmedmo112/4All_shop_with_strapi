

import 'package:flutter/material.dart';
import 'package:fshop/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/product_models.dart';

class ProductController extends GetxController{
  RxList<ProductData> productList = <ProductData> [].obs;
  RxList favoriteList = <ProductData> [].obs;
  RxBool isLoading = true.obs;

  RxList<ProductData> searchList = <ProductData> [].obs;
  TextEditingController searchTextController = TextEditingController();
  bool isWrittenAtSearchBar = false;

  GetStorage storage = GetStorage();


  @override
  void onInit() {
    readFavorite();
    getProducts();
    super.onInit();
  }

  void getProducts()async{
    List<ProductData>? products = await ProductServices.getProducts();

    try {
      if (products!.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void readFavorite(){
    List? list =  storage.read<List>("favoritie");
    if(list != null){
     favoriteList =  list.map((element) => ProductData.fromJson(element)).toList().obs;
    }
  }

  void addToFavoriteList(int productId)async{

    favoriteList.add(productList
    .firstWhere((element) => element.attributes!.uid == productId));
    await storage.write("favoritie", favoriteList);
  }

  void removeFromFavoriteList(int productId)async{
    for (var i = 0; i < favoriteList.length; i++) {
      if (productId == favoriteList[i].attributes.uid) {
        favoriteList.removeAt(i);
      }
    }
    await storage.write("favoritie", favoriteList);
  }

  bool isAtFavorite(int productId){
    return favoriteList.any((element) => element.attributes.uid == productId);
  }

  void addSearchToList(String searchName){
    searchList.value = productList.where((search) {
      String title = search.attributes!.title.toString().toLowerCase();
      String price = search.attributes!.price.toString().toLowerCase();
      return title.contains(searchName.toLowerCase()) || price.contains(searchName.toLowerCase()) ;

    }).toList();
  }

  void checkSearchIsEmpty(){
    if (searchTextController.text.isNotEmpty) {
       isWrittenAtSearchBar=true;
    }else{
       isWrittenAtSearchBar=false;
    }
    update();
    
  }

  void clearSearch(){
    isWrittenAtSearchBar=false;
    addSearchToList("");
    searchTextController.clear();
    update();
  }

}