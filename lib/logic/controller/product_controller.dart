
import 'package:fshop/services/product_services.dart';
import 'package:get/get.dart';

import '../../models/product_models.dart';

class ProductController extends GetxController{
  RxList productList = <ProductModel> [].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
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
}