

import 'package:flutter/material.dart';
import 'package:fshop/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/product_models.dart';

class ProductController extends GetxController{
  RxList productList = <ProductModel> [].obs;
  RxList favoriteList = <ProductModel> [].obs;
  RxBool isLoading = true.obs;

  RxList searchList = <ProductModel> [].obs;
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
    List? list =  storage.read<List>("favorities");
    if(list != null){
     favoriteList =  list.map((element) => ProductModel.fromJson(element)).toList().obs;
    }
  }

  void addToFavoriteList(int productId)async{

    favoriteList.add(productList
    .firstWhere((element) => element.id == productId));
    await storage.write("favorities", favoriteList);
  }

  void removeFromFavoriteList(int productId)async{
    for (var i = 0; i < favoriteList.length; i++) {
      if (productId == favoriteList[i].id) {
        favoriteList.removeAt(i);
      }
    }
    await storage.write("favorities", favoriteList);
  }

  bool isAtFavorite(int productId){
    return favoriteList.any((element) => element.id == productId);
  }

  void addSearchToList(String searchName){
    searchList.value = productList.where((search) {
      String title = search.title.toString().toLowerCase();
      String price = search.price.toString().toLowerCase();
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