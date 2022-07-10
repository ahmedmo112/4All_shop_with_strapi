
import 'package:fshop/models/category_model.dart';
import 'package:fshop/models/product_models.dart';
import 'package:fshop/services/category_services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  RxList<String> categoryNameList = <String>[].obs;
  RxBool isCategoryLoading = false.obs;
  RxBool isCategoryProductsLoading = false.obs;
  RxList<ProductData> categoryProducts = <ProductData>[].obs;

  List catrgoryImages=[
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg", //men's
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",//women's clothing
    "https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg",//electronics
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg", //jewelery
  ];

  @override
  void onInit() {
    getCatrgoryData();
    super.onInit();
  }

  void getCatrgoryData()async{
    List<CategoryData> categoryName = await CategoryServises.getCategories();
    String name;
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryName.forEach((element) { 
        name = element.attributes!.name!;
        categoryNameList.add(name);
        });
      }
    } finally {
      isCategoryLoading(false);
      
    }
  }

   getProductsOfCategory(String category)async{
    isCategoryProductsLoading(true);
    List<ProductData> productsList = await CategoryProductServises.getCategoryProduct(category);
    try {
      if (productsList.isNotEmpty) {
        categoryProducts.value = productsList;
      }
    } finally {
      isCategoryProductsLoading(false);
      
    }
  }
}